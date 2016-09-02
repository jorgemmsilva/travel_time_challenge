require 'net/http'

class Properties
  def getProperties(lat, lng)
    uri = URI("https://api.rentify.com/v2/properties.json?"+
              "search%5Bbedrooms%5D=2&search%5Barea%5D=shoreditch+london+n1+uk&search%5Blat%5D=#{lat}&search%5Blng%5D=#{lng}&search%5Ball%5D=true")


    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri

        response = http.request request

        result = JSON.parse(response.body)

        return result
    end
  end

end
