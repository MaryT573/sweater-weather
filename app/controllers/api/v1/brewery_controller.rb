class Api::V1::BreweryController < ApplicationController
    def index
        location = MapFacade.find_lat_long(forecast_params)
        weather = WeatherFacade.forecast(location)
        render json: ForecastSerializer.new(weather)
      end
      
    private
        
    def forecast_params
        params.permit(:location)
    end
end