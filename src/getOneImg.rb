require "json"
require "open-uri"

filename = ARGV[0]

json_data = open(filename) do |io|
    JSON.load(io)
end

# json_data['items'].each do |item|
#     if url = item['link']
#         p url
#         save_image(url, dirname)
#     end
# end
item = json_data['items'].sample
print item['link']
