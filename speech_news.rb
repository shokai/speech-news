#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/bootstrap'
require 'ArgsParser'

parser = ArgsParser.parser
parser.bind(:loop, :l, 'do loop', false)
parser.bind(:help, :h, 'show help')
parser.comment(:speech_interval, 'speech interval (sec)', 3)
parser.comment(:interval, 'news fetch interval (sec)', 60)

first, params = parser.parse ARGV
if parser.has_option(:help)
  puts parser.help
  exit 1
end

news = News.new
cache = Array.new

loop do
  news.get.each do |n|
    next if cache.include? n
    cache << n
    puts n
    n.gsub!(/[\'\"\r\n;`]/,'')
    system "say #{n}"
    sleep params[:speech_interval].to_f
  end
  break unless params[:loop]
  sleep params[:interval].to_f
end
