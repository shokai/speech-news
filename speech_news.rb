#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require File.expand_path 'bootstrap', File.dirname(__FILE__)
require 'args_parser'

parser = ArgsParser.parse ARGV do
  arg :help, 'show help', :alias => :h
  arg :say, 'speech command', :default => '/usr/bin/say'
  arg :speech_interval, 'speech interval (sec)', :default => 3
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

system "#{parser[:say]} '#{parser[:before]}'"


News.new.get.each do |n|
  n.gsub!(/[…\'\"\r\n\s;`]/, '、')
  puts n
  system "#{parser[:say]} '#{n}'"
  sleep parser[:speech_interval].to_f
end

system "#{parser[:say]} '#{parser[:after]}'"
