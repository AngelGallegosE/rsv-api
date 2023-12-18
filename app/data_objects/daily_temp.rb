class DailyTemp
  attr_reader :day, :min, :max

  def initialize(day)
    @day = unix_ts_to_date_time(day['dt']).day
    @min = day['temp']['min']
    @max = day['temp']['max']
  end
  
  def unix_ts_to_date_time(timestamp)
    DateTime.strptime(timestamp.to_s, '%s')
  end
end
