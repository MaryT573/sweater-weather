class Api::V1::BreweryController < ApplicationController
    def index
        city = MapFacade.find_lat_long(params[:location])
        data = {current_weather: WeatherFacade.current(city), breweries: BrewFacade.get_brew(city, params[:quantity]), location: params[:location]}
         
        render json: BrewerySerializer.format_response(data)
      end
    end 
