#!/usr/bin/env ruby

require 'nokogiri'

# This script will check all of the files in _site to make sure their links are not dead
# It assumes the Jekyll project has already been built

# First collect all of the files we're going to check
files = `find ./_site -name *.html`.lines.map(&:strip)
cached = {}
errors = []
warnings = []
# images is separate for now so it doesn't fail - eventually will be put back into errors
images = []

excluded = ['/login', '/signup', '/logout', '/inquiries', '/testdrive', '/develop', '/manage', '/cancel_account', '/apps', '/apps/new', '/oauth/token', '/oauth/authenticate', '/search']

def get_destination(file, link)
  if file && link
    # First remove any URL params
    link = link.split('?').first
    # Then any fragments
    link = link.split('#').first
    if link[0] == '/'
      # It's absolute, so we can look in _site directly
      return "#{link}"
    else
      # It's relative, so we have to work out where we are, this is a quick and dirty approach for now
      path = file.gsub('./_site', '').split('/')
      path.pop
      path << link
      path.join('/')
    end
  end
end

files.each do |file|
  # We're caching this so that we can eventually go and check the anchor references on other pages
  cached[file] ||= Nokogiri::HTML(open(file))
  cached[file].css('a').each do |a|
    link = a['href']
    if link =~ /^https?\:\/\/(www\.)?xively\.com/
      errors << "Link hardcoded to xively.com (#{file}) (#{link})"
      next
    end
    if link =~ /https?\:\/\/(www\.)?cosm\.com/
      errors << "Link hardcoded to cosm.com (#{file}) (#{link})"
      next
    end
    if link =~ /objectnetworks\.atlassian\.net/
      errors << "Link points to confluence (#{file}) (#{link})"
      next
    end
    if link =~ /https?\:\/\//
      # Maybe go and check the external link is not dead
      next
    else
      next if link == '/'
      next if link =~ /mailto/

      next if link == '#' || link == '' || link.nil?
      # Make sure it's not empty -- disabled for now because there are too many javascript style links
      #if link == '#' || link == '' || link.nil?
      #  errors << "Link is empty (#{file}) (#{link})"
      #  next
      #end

      # Make sure it doesn't end in .html
      if link =~ /.*\.html/
        errors << "Link ends in .html (#{file}) (#{link})"
        next
      end

      if link[0] == '#'
        # It's a local URL fragment so check it's on this page
        if cached[file].css(link).length == 0 && cached[file].css("#{link}Tab").length == 0
          errors << "Missing URL fragment from local page (#{file}) (#{link})"
          next
        end
      else
        # It's a local link so make sure it exists
        dest = get_destination(file, link)

        # Make sure it has a trailing slash
        unless dest =~ /.*\/\Z/
          errors << "Link has no trailing slash (#{file}) (#{link})"
          next
        end
        unless dest
          errors << "Problem parsing link (#{file}) (#{link})"
          next
        end

        # Remove any trailing slashes to make sure we get the path correct
        dest = dest.chop if dest[-1,1] == '/'
        unless File.exist?("./_site#{dest}.html") || File.exist?("./_site#{dest}/index.html") || excluded.include?(dest)
          errors << "Link destination is wrong (#{file}) (#{link})"
          #puts "Error: " + dest

        end
      end
    end
  end
  cached[file].css('img').each do |img|
    # Make sure the image exists
    src = img['src']
    unless src =~ /\Ahttps?/
      unless File.exist?("./_site#{src}")
        images << "Image missing (#{file}) (#{src})"
      end
    end
  end
  raw_content = File.read(file)
  raw_content.each_line do |line|
    if line =~ /TODO/
      warnings << "TODO in file #{file} (\"#{line.strip}\")"
    end
  end
end

warnings.each do |warning|
  puts "WARNING: #{warning}"
end

images.each do |warning|
  puts "WARNING: #{warning}"
end

errors.each do |error|
  puts "ERROR: #{error}"
end

# Disabled for now because we know the build will fail until the docs are in properly
exit errors.length

