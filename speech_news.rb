#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/bootstrap'

news = News.new
news.get.each do |n|
  puts n
  n.gsub!(/[\'\"\r\n;`]/,'')
  system "say #{n}"
  sleep 3
end
