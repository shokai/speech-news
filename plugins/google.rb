# Google News Plugin
# Plugin must return String Array

require 'simple-rss'
require 'httparty'

url = "http://news.google.com/news?hl=ja&ned=us&ie=UTF-8&oe=UTF-8&output=rss"

rss = SimpleRSS.parse HTTParty.get(url).body

rss.items.map{|item|
  item.title.gsub(/\s+-\s+.+/,'').to_s
}
