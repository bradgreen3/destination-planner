class Api::V1::DestinationsController < ApplicationController

  def index
    render json: Destination.all
  end

end
