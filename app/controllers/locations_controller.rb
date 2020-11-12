class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  # GET /locations
  def index
    @locations = Location.all
    render json: @locations.to_json(include: :temperatures)
  end

  # GET /locations/1
  def show
    @temperatures = @location.temperatures
    # render(json: {location: @location, temperatures: @temperatures}) # renders location and temps separately
    render json: @location.to_json(include: :temperatures)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:lat, :lng, :name)
    end
end
