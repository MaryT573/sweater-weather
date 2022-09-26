class Api::V1::ItemsController < ApplicationController
    def index
        location = MapFacade.get_weather(forecast_params)
        weather = WeatherFacade.forecast(location)
        render json: ForecastSerializer.new(weather)
      end
      
    private
        
    def forecast_params
        params.permit(:location)
    end
end