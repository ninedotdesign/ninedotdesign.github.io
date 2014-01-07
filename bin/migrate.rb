#!/usr/bin/env ruby

require 'html_massage'
require 'nokogiri'
require 'uri'

EXPORT_DIR = 'exported_from_confluence'

def fix_tables(content)
  content.css('table').each do |t|
    output = ''
    separator = ''
    t.css('thead th').each do |th|
      output += "| #{th.text.strip} "
      separator += "|#{ '-' * (th.text.length + 2)}"
    end
    output += "<br />#{separator}<br />"
    t.css('tbody tr').each do |tr|
      tr.css('td').each do |td|
        output += "| #{td.text} "
      end
      output += "<br />"
    end

    t.inner_html = output
  end
end

def identify_language(cssClass)
  return '' if cssClass.nil?
  allowed = ['c', 'javascript', 'bash', 'json', 'xml', 'csvx', 'java', 'ruby']
  cssClass.split(/\s/).each do |c|
    return c if allowed.include?(c)
  end
  return ''
end

def sluggify(text)
  text.downcase
    .gsub(' ', '_')
    .gsub('/', '_')
    .gsub('+', '_')
    .gsub('(', '')
    .gsub(')', '')
    .gsub(',', '')
    .gsub('.', '')
end

def fix_pre(content)
  content.css('pre').each do |pre|
    type = identify_language(pre.attr('class'))
    inner_lines = pre.text.strip.split("\n")
    inner_lines = inner_lines.map{|l| "#{l.gsub(' ', '&nbsp;').gsub('<', '&lt;').gsub('>', '&gt;').gsub('\_', '_')}"}
    pre.inner_html = "```#{type}<br />#{inner_lines.join("<br />")}<br />```"
  end
end

def fix_link(link)
  link = URI.unescape(link)
  if link =~ /https?\:\/\/objectnetworks\.atlassian.net\/wiki\/display\/API\/(.*)/
    link = sluggify($1)
  end
  unless link =~ /https?\:\/\//
    if link =~ /(.*)\.html/
      link = $1
    end
    link = sluggify(link)
  end
  URI.escape(link)
end

def fix_links(content)
  content.css('a').each do |a|
    a['href'] = fix_link(a.attr('href'))
  end
end

def convert(file)
  page = Nokogiri::HTML(open(file))
  # extract the title
  title = page.css('title').text
  # extract the body
  content = page.css('#content')
  # remove the attachments block
  attachments = content.css('#attachments')
  content.css('#attachments').first.parent.parent.remove if attachments.length == 1
  fix_tables(content)
  fix_pre(content)
  fix_links(content)
  # convert the body
  markdown = HtmlMassage.markdown(content.to_s)
  markdown.gsub!('\\_', '_')
  return [title, markdown]
end

Dir.glob("#{EXPORT_DIR}/API/*.html").each do |f|
  unless f.match("#{EXPORT_DIR}/API/index.html") || f.match("#{EXPORT_DIR}/API/Docs.html")
    title, content = convert(f)
    title = title.gsub!('Docs : ', '')
    outname = sluggify(title)
    front_matter = {'layout' => 'apidoc', 'section' => 'dev', 'active' => 'api', 'name' => title}
    doc = YAML.dump(front_matter)
    doc += "\n---\n\n"
    doc += content
    outfile = File.open("content/dev/api/#{outname}.md", 'w')
    outfile.write(doc)
    outfile.close
  end
end
