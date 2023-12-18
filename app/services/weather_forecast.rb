class WeatherForecast
  def self.call(city)
    reservamos_response = ReservamosApi.get_places(city)
    return [] if reservamos_response.empty?
    cities_locations = CityLocations.extract_cities(reservamos_response)

    open_weather_response = OpenWeatherMapApi.get_daily_forecast(cities_locations)
    return [] if open_weather_response.empty?
    min_max_temperatures = ForecastLocations.extract_min_max_temp(open_weather_response)

    min_max_temperatures
  end
end
