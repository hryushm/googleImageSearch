require "json"
require "open-uri"

filename = ARGV[0]
dirname = ARGV[1]

def save_image(url, dirName)
  # ready filepath
  fileName = File.basename(url)
  filePath = dirName + fileName

  # write image adata
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
    # if item['pagemap']['cse_image']
    #     p url = item['pagemap']['cse_image'][0]['src']
    #     save_image(url)
    # end
    if url = item['link']
        p url
        save_image(url, dirname)
    end
end
