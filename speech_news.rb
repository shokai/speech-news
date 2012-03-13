#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/bootstrap'

news = News.new
news.get.each do |n|
  system "say #{n}"
end
