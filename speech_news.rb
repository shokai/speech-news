#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.dirname(__FILE__)+'/bootstrap'
require 'args_parser'

parser = ArgsParser.parse ARGV do
  arg :loop, 'do loop', :alias => :l, :default => false
  arg :help, 'show help', :alias => :h
  arg :speech_interval, 'speech interval (sec)', :default => 3
  arg :interval, 'news fetch interval (sec)', :default => 60
  h = Time.now.hour
  hello = (5 < h and h < 11) ? 'おはようございます' :
    (10 < h and h < 17) ? 'こんにちは' : 'こんばんは'
  arg :before, 'before speech news', :default => "#{hello}、#{h}時のニュースです。"
  arg :after, 'after speech news', :default => "以上、#{h}時のニュースでした。"
end

if parser.has_option? :help
  puts parser.help
  exit 1
end

system "say '#{parser[:before]}'"

news = News.new
cache = Array.new

loop do
  news.get.each do |n|
    n.gsub!(/[…\'\"\r\n\s;`]/, '、')
    next if cache.include? n
    cache << n
    puts n
    system "say #{n}"
    sleep parser[:speech_interval].to_f
  end
  break unless parser[:loop]
  sleep parser[:interval].to_f
end

system "say '#{parser[:after]}'"
