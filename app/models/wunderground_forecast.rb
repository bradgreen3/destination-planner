class WundergroundForecast
  attr_reader :weekday, :monthname, :day, :high, :low, :conditions

  def initialize(day={})
    @weekday = day[:date][:weekday]
    @monthname = day[:date][:monthname]
    @day = day[:date][:day]
    @high = day[:high][:fahrenheit]
    @low = day[:low][:fahrenheit]
    @conditions = day[:conditions]
    @full_date = full_date
  end

  def self.ten_day(zip)
    WundergroundService.new.forecast_10day(zip)[:forecast][:simpleforecast][:forecastday].map do |day|
      WundergroundForecast.new(day)
    end
  end

  def full_date
    "#{@weekday}, #{@monthname} #{@day}"
  end

end
