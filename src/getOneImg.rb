require "json"
require "open-uri"

filename = ARGV[0]
json_data = open(filename) do |io|
    JSON.load(io)
end
item = json_data['items'].sample
print item['link']
