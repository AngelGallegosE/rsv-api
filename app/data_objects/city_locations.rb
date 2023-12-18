class CityLocations
  def self.extract_cities(places)
    places
      .select { |place| place['result_type'] == 'city' }
      .map { |city| City.new(city['city_name'], city['lat'], city['long']) }
  end
end
