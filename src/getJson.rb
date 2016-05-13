require 'open-uri'
require 'addressable'
require 'json'

word = ARGV[0]
filename = '../json/' + word + '.json'
uri = "https://www.googleapis.com/customsearch/v1?key=#{ENV['API_KEY']}&cx=#{ENV['SEARCH_ENGINE_ID']}&searchType=image&q=#{word}"

open(filename, 'wb') do |output|
  open(URI.escape(uri)) do |data|
    output.write(data.read)
  end
end
