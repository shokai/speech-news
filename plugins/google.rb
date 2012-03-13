# google newsを読む
# 結果は配列で返す

require 'rubygems'
require 'simple-rss'
require 'open-uri'

url = "http://news.google.com/news?hl=ja&ned=us&ie=UTF-8&oe=UTF-8&output=rss"

rss = SimpleRSS.parse open url

rss.items.map do |item|
  item.title.gsub(/\s+-\s+.+/,'')
end
