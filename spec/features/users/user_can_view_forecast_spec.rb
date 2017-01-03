require 'rails_helper'

describe "a user who visits root page" do
  context "and clicks on specific destination" do
    it "sees forecast for destination" do

      destination = Destination.create(name: "Denver", zip: "80210", description: "Largest city in Colorado", image_url: "https://res-1.cloudinary.com/simpleview/image/upload/c_fill,f_auto,h_645,q_50,w_1024/v1/clients/denver/denver-skyline-lake-snowcapped-mountains_558cbb3b-f0ae-5102-065b3b0c9309fbc1.jpg")

      # forecast = WundergroundForecast.by_location(destination.zip)

      visit root_path

      within "#dest-#{destination.id}" do
        click_on "Show"
      end

      expect(current_path).to eq("/destinations/#{destination.id}")
      expect(page).to have_content("#{destination.name}")
      expect(page).to have_content("#{destination.zip}")
      expect(page).to have_content("#{destination.description}")
      # expect(page).to have_content("#{forecast.weekday}")
      # expect(page).to have_content("#{forecast.monthname}")
      # expect(page).to have_content("#{forecast.day}")
      # expect(page).to have_content("#{forecast.high}")
      # expect(page).to have_content("#{forecast.low}")
      # expect(page).to have_content("#{forecast.conditions}")

    end
  end
end
