require "net/http"
require "open-uri"
require "json"

class GoogleVisionService
attr_reader :image_url
  def initialize(image_url)
    @image_url = image_url
  end

  def call
    api_key = ENV['GOOGLE_API_KEY']
    json_request = {
      "requests": [
        {
          "features": [
            {
              "maxResults": 50,
              "type": "TEXT_DETECTION"
            },
            {
              "maxResults": 50,
              "model": "builtin/latest",
              "type": "DOCUMENT_TEXT_DETECTION"
            }
          ],
        "image": {
            "source": {
              "imageUri": @image_url
            }
          }
        }
      ]
    }
    uri = URI.parse("https://vision.googleapis.com/v1/images:annotate?key=#{api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == "https"

    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = json_request.to_json
    request["Content-Type"] = "application/json"

    response = http.request(request)

    if response.code == "200"
      health_data = JSON.parse(response.body)['responses'][0]['textAnnotations']
      if health_data
        data = health_data.map { |num| num['description'].to_i }
        target_data = data.select { |fig| fig != 0 }
        target_data
      else
        puts 'No text annotations found in the response.'
      end
    else
      puts "Error response from API: #{response.body}"
    end
  end
end
