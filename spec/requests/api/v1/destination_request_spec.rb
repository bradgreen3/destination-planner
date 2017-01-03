require 'rails_helper'

describe "destinations endpoint" do
  context "GET /destinations" do
    it "returns all destinations" do
      Destination.create(name: "Denver", zip: "80210", description: "Capital of Colorado", image_url: "https://www.firetainment.com/wp-content/uploads/2016/04/denver-skyline-mountains-wallpaper-wallpaper-3.jpg")
      Destination.create(name: "Eugene", zip: "97405", description: "Home of the University of Oregon", image_url: "http://housely.com/wp-content/uploads/2016/03/8162177045_7ff653aaa3_b.jpg")
      Destination.create(name: "Flagstaff", zip: "86001", description: "Home of Northern Arizona University", image_url: "http://flagstaff-lawyer.com/wp-content/uploads/2011/07/Flagstaff-Trial-Lawyers.jpg")

      get "/api/v1/destinations"

      destinations = JSON.parse(response.body)

      expect(response).to be_success
      expect(destinations.count).to eq(3)
    end
  end
end
