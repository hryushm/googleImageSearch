require "json"
require "open-uri"

filename = ARGV[0]
dirname = ARGV[1]

def save_image(url, dirName)
  fileName = File.basename(url)
  filePath = dirName + fileName
  open(filePath, 'wb') do |output|
    open(url) do |data|
      output.write(data.read)
    end
  end
end

json_data = open(filename) do |io|
    JSON.load(io)
end

json_data['items'].each do |item|
    if url = item['link']
        puts 'Downloading : ' + url
        save_image(url, dirname)
    end
end
