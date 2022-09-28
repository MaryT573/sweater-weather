class Api::V1::TripController < ApplicationController

    def create
        directions = MapFacade.route(params[:origin], params[:destination])

        user = User.find_by(api_key: params[:api_key]) 

        if directions.blocked == true
            render json: { error: 'Impossible Route' }, status: 401
        elsif user.api_key != params[:api_key]
            render json: { error: 'Wrong Key' }, status: 401
        else
            route_time = directions.time.to_i
            route = {time: route_time}     
            require 'pry'; binding.pry
        end

    end
    #info needed by serializer (start and end), travel time, weather at ETA(temp conditions)
    #if else statement render only excutes if api_key exists and route is not blocked
    #
   
    private

    def user_params
        params.permit(:api_key)
    end

    def location_params
        params.permit(:origin, :destination)
    end
end