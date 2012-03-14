#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/bootstrap'
require 'ArgsParser'

parser = ArgsParser.parser
parser.bind(:loop, :l, 'do loop', false)
parser.bind(:help, :h, 'show help')
parser.comment(:speech_interval, 'speech interval (sec)', 3)
parser.comment(:interval, 'news fetch interval (sec)', 60)
h = Time.now.hour
hello = (5 < h and h < 11) ? 'おはようございます' :
  (10 < h and h < 17) ? 'こんにちは' : 'こんばんは'
parser.comment(:before, 'before speech of news', "#{hello}、#{h}時のニュースです。")
parser.comment(:after, 'after speech of news', "以上、#{h}時のニュースでした。")

first, params = parser.parse ARGV
if parser.has_option(:help)
  puts parser.help
  exit 1
end

system "say '#{params[:before]}'"

news = News.new
cache = Array.new

loop do
  news.get.each do |n|
    n.gsub!(/[…\'\"\r\n\s;`]/, '、')
    next if cache.include? n
    cache << n
    puts n
    system "say #{n}"
    sleep params[:speech_interval].to_f
  end
  break unless params[:loop]
  sleep params[:interval].to_f
end

system "say '#{params[:after]}'"
