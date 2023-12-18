class OpenWeatherMapApi
  require 'net/http'
  require 'uri'

  BASE_URL = 'https://api.openweathermap.org/data/2.5/onecall'
  APP_KEY = ''

  def self.get_daily_forecast(cities)
    daily_forecasts = []

    cities.each do |city|
      response = self.get_api_call(city)
      json = JSON.parse(response.body)
      return [] if response.code != '200'

      json['city_name'] = city.city_name

      daily_forecasts << json
    end

    daily_forecasts
  end

  private

  def self.get_api_call(city)
    url = URI.parse(BASE_URL)

    params = { 
      'lat' => city.lat, 
      'lon' => city.long,
      'exclude' => 'current,minutely,hourly,alerts',
      'units' => 'metric',
      'appid' => APP_KEY
    }

    query_string = URI.encode_www_form(params)
    url.query = query_string

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == 'https'

    request = Net::HTTP::Get.new(url)

    http.request(request)
  end

end
