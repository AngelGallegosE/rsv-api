class ReservamosApi
  require 'net/http'
  require 'uri'

  BASE_URL = 'https://search.reservamos.mx/api/v2/places'

  def self.get_places(city)
    response = self.get_api_call(city)

    # NOTE: ReservamosApi returns a 201
    JSON.parse(response.body)
  end

  private

  def self.get_api_call(city)
    url = URI.parse(BASE_URL)
    params = { 'q' => city }

    query_string = URI.encode_www_form(params)
    url.query = query_string

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == 'https'

    request = Net::HTTP::Get.new(url)

    http.request(request)
  end
end
