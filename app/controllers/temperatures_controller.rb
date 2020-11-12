class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :update, :destroy]

  # GET /temperatures
  def index
    @temperatures = Temperature.all

    render json: @temperatures
  end

  # POST /temperatures
  def create
    @temperature = Temperature.new(temperature_params)

    if @temperature.save
      render json: @temperature, status: :created, location: @temperatures
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def temperature_params
      params.require(:temperature).permit(:average_high_f, :average_low_f, :location_id)
    end
end
