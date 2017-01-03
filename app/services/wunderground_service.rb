class WundergroundService

  def conn
    Faraday.new(:url => "http://api.wunderground.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def forecast_10day(zip)
    response = conn.get "/api/#{ENV["api_key"]}/forecast10day/q/#{zip}.json"
    JSON.parse(response.body, symbolize_names: true)
  end

end
