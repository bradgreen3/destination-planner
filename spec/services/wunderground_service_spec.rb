require 'rails_helper'

describe "WundergroundService" do
  context "forecast_10day" do
    it "returns 10-day forecast for location" do
      VCR.use_cassette("#forecast_10day") do
        forecast_10day = WundergroundService.new.forecast_10day("80210")

        expect(forecast_10day).to be_an(Array)
        expect(forecast_10day).to have_key(:weekday)
        expect(forecast_10day).to have_key(:monthname)
        expect(forecast_10day).to have_key(:day)
        expect(forecast_10day).to have_key(:high)
        expect(forecast_10day).to have_key(:low)
        expect(forecast_10day).to have_key(:conditions)

      end
    end
  end
end
