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
    context "GET /destinations/:id" do
      it "returns a destination" do
        destination1 = Destination.create(name: "Denver", zip: "80210", description: "Capital of Colorado", image_url: "https://www.firetainment.com/wp-content/uploads/2016/04/denver-skyline-mountains-wallpaper-wallpaper-3.jpg")
        destination2 = Destination.create(name: "Eugene", zip: "97405", description: "Home of the University of Oregon", image_url: "http://housely.com/wp-content/uploads/2016/03/8162177045_7ff653aaa3_b.jpg")

        get "/api/v1/destinations/#{destination1.id}"

        destination_response = JSON.parse(response.body)

        expect(response).to be_success
        expect(destination_response["name"]).to eq("Denver")
        expect(destination_response["description"]).to eq("Capital of Colorado")
    end
  end
  context "POST /destinations" do
    it "creates a new destination" do
      destination_params = { name: "Denver",
                             zip: "80210",
                             description: "Capital of Colorado",
                             image_url: "https://www.firetainment.com/wp-content/uploads/2016/04/denver-skyline-mountains-wallpaper-wallpaper-3.jpg"}

      post "/api/v1/destinations", params: {destination: destination_params}

      destination = Destination.last

      expect(response).to be_success
      expect(destination.name).to eq(destination_params[:name])
    end
  end
  context "PUT /destinations/:id" do
    it "updates destination" do

      id = Destination.create(name: "Denver", zip: "80210", description: "Capital of Colorado", image_url: "https://www.firetainment.com/wp-content/uploads/2016/04/denver-skyline-mountains-wallpaper-wallpaper-3.jpg").id
      previous_zip = Destination.last.zip

      destination_params = { zip: "80211" }

      put "/api/v1/destinations/#{id}", params: {destination: destination_params}

      destination = Destination.find_by(id: id)

      expect(response).to be_success
      expect(destination.zip).to_not eq(previous_zip)
      expect(destination.zip).to eq("80211")
    end
  end
  context "DELETE /destinations/:id" do
    it "deletes a destination" do

      destination = Destination.create(name: "Denver", zip: "80210", description: "Capital of Colorado", image_url: "https://www.firetainment.com/wp-content/uploads/2016/04/denver-skyline-mountains-wallpaper-wallpaper-3.jpg")

      expect{delete "/api/v1/destinations/#{destination.id}"}.to change(Destination, :count).by(-1)

      expect(response).to be_success
      expect{Destination.find(destination.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
