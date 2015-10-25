require 'httparty'
require 'simple-rss'

Dir.glob(File.dirname(__FILE__)+'/libs/*.rb').each do |rb|
  puts "loading #{rb}"
  require rb
end
