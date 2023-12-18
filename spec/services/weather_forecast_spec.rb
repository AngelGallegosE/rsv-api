require 'rails_helper'
require_relative '../support/stubs/reservamos_api_response'
require_relative '../support/stubs/api_weather_api_response'

describe WeatherForecast do
  describe '.call' do
    let(:city) { 'mon' }

    it 'returns min/max temperatures' do
      reservamos_response = [{ 'city_name' => 'City1', 'lat' => 'lat1', 'long' => 'long1' }]
      allow(ReservamosApi).to receive(:get_places).with(city).and_return(reservamos_response)

      cities_locations = [{ 'city_name' => 'City1', 'lat' => 'lat1', 'long' => 'long1' }]
      allow(CityLocations).to receive(:extract_cities).with(reservamos_response).and_return(cities_locations)

      open_weather_response = [{ 'city_name' => 'City1', 'daily' => [{ 'temp' => { 'min' => 10, 'max' => 20 } }] }]
      allow(OpenWeatherMapApi).to receive(:get_daily_forecast).with(cities_locations[0..1]).and_return(open_weather_response)

      min_max_temperatures = [{ 'city_name' => 'City1', 'daily' => [{ 'min' => 10, 'max' => 20 }] }]
      allow(ForecastLocations).to receive(:extract_min_max_temp).with(open_weather_response).and_return(min_max_temperatures)

      expect(WeatherForecast.call(city)).to eq(min_max_temperatures)
    end


    it 'returns empty array if reservamos_response is empty' do
      allow(ReservamosApi).to receive(:get_places).with('').and_return([])

      expect(WeatherForecast.call('')).to eq([])
    end

    it 'returns empty array if open_weather_response is empty' do
      reservamos_response = [{ 'city_name' => 'City1', 'lat' => 'lat1', 'long' => 'long1' }]
      allow(ReservamosApi).to receive(:get_places).with(city).and_return(reservamos_response)

      cities_locations = [{ 'city_name' => 'City1', 'lat' => 'lat1', 'long' => 'long1' }]
      allow(CityLocations).to receive(:extract_cities).with(reservamos_response).and_return(cities_locations)

      allow(OpenWeatherMapApi).to receive(:get_daily_forecast).with(cities_locations[0..1]).and_return([])

      expect(WeatherForecast.call(city)).to eq([])
    end
  end


end
