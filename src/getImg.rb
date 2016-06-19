require "json"
require "open-uri"

filename = ARGV[0]
dirname = ARGV[1]

def save_image(url, dirName)
    fileName = File.basename(url)
    if fileName =~ /\.(png|jpg|jpeg)$/
        filePath = dirName + fileName
        puts 'Downloading : ' + url
        open(filePath, 'wb') do |output|
            begin
                open(url) do |data|
                    output.write(data.read)
                end
            rescue OpenURI::HTTPError => e
                p e
            end
        end
    end
end

json_data = open(filename) do |io|
    JSON.load(io)
end

json_data['items'].each do |item|
    if url = item['link']
        save_image(url, dirname)
    end
end
