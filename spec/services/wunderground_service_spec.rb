require 'rails_helper'

describe "WundergroundService" do
  context "forecast_10day" do
    it "returns 10-day forecast for location" do
      VCR.use_cassette("#forecast_10day") do
        forecast_10day = WundergroundService.new.forecast_10day("80210")
        forecast_day1 = WundergroundService.new.forecast_10day("80210")[:forecast][:simpleforecast][:forecastday].first

        expect(forecast_10day).to be_a(Hash)
        expect(forecast_day1[:date]).to have_key(:weekday)
        expect(forecast_day1[:date]).to have_key(:monthname)
        expect(forecast_day1[:date]).to have_key(:day)
        expect(forecast_day1[:high]).to have_key(:fahrenheit)
        expect(forecast_day1[:low]).to have_key(:fahrenheit)
        expect(forecast_day1).to have_key(:conditions)

      end
    end
  end
end
