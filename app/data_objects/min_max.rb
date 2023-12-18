class MinMax
  attr_reader :city_name, :daily

  def initialize(city_name, daily)
    @city_name = city_name
    @daily = parse_daily(daily)
  end
  
  def parse_daily(forecast)
    forecast.map do |day|
      DailyTemp.new(day)
    end.last(7)
  end
end
