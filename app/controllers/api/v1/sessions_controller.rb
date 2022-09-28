class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user.authenticate(params[:password])
            render json: UsersSerializer.new(user), status: 200
        else
            render json: { error: 'Incorrect Credentials' }, status: 400
        end 
    end

    private

    def session_params
        params.permit(:username, :password)
    end
end