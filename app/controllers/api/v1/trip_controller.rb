class Api::V1::TripController < ApplicationController

    def create
        directions = MapFacade.route(params[:origin], params[:destination])

        if User.find_by(api_key: params[:api_key])     
            if directions.blocked == nil || directions.bordercrossing == nil
                render json: { error: 'Impossible Route' }, status: 401
            else
                route_time = directions.time.to_i
                city = MapFacade.find_lat_long(params[:destination])
                route = {weather: WeatherFacade.hourly_eta(city, route_time), start: params[:origin], end: params[:destination], time: directions.time}     
                render json: RoadTripSerializer.route(route), status: 201
            end
        else
            render json: { error: 'Wrong Key' }, status: 401
        end
    end
   
    private

    def user_params
        params.permit(:api_key)
    end

    def location_params
        params.permit(:origin, :destination)
    end
end