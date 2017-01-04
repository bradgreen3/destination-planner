class Api::V1::DestinationsController < ApplicationController

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    render json: Destination.create(destination_params)
  end

  def update
    render json: Destination.update(params[:id], destination_params)
  end

  def destroy
    render json: Destination.delete(params[:id])
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end

end
