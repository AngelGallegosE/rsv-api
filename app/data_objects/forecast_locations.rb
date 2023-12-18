class ForecastLocations
  def self.extract_min_max_temp(forecasts)
    forecasts.map do |forecast|
      MinMax.new(forecast['city_name'], forecast['daily'])
    end
  end
end
