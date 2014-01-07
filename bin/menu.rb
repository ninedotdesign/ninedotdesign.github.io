#!/usr/bin/env ruby

require 'nokogiri'
require 'uri'
require 'pp'

EXPORT_DIR = 'exported_from_confluence'

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

def extract_structure(section)
  li = section.at_xpath('./li')
  link = li.at_xpath('./a')
  output = {'label' => link.text, 'url' => sluggify(link.text)}
  children = li.xpath('./ul')
  output['list'] = children.map{ |child| extract_structure(child) } if children.length > 0
  output
end

index = Nokogiri::HTML(open("#{EXPORT_DIR}/API/index.html"))
sections = index.css('.pageSection > ul > li > ul')
structure = {'sidebar' => sections.map{ |section| extract_structure(section) } }
puts YAML.dump(structure)

