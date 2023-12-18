class City
  attr_reader :city_name, :lat, :long

  def initialize(city_name, lat, long)
    @city_name = city_name
    @lat = lat
    @long = long
  end
end


