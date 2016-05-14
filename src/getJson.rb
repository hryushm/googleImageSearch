require 'open-uri'
require 'addressable'
require 'json'

word = ARGV[0]
filename = '../json/' + word + '.json'
uri = "https://www.googleapis.com/customsearch/v1?"
uri += "key=#{ENV['API_KEY']}"
uri += "&cx=#{ENV['SEARCH_ENGINE_ID']}"
uri += "&searchType=image"
uri += "&q=#{word}"
# uri += "&safe=high" # safe search

open(filename, 'wb') do |output|
  open(URI.escape(uri)) do |data|
    output.write(data.read)
  end
end
