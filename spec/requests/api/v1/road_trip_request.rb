require 'rails_helper'

RSpec.describe 'roadtrip Endpoint' do
    describe 'get route' do 
        it 'Happy Path: gets route and weather' do
            user_params = {
                "username": "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
            }
            post '/api/v1/users', params: user_params

            user_result = JSON.parse(response.body, symbolize_names: true)

            trip_params = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": user_result[:data][:attributes][:api_key]
            }
            post '/api/v1/road_trip', params: trip_params

            expect(response).to be_successful
            expect(response.status).to eq(201)

            result = JSON.parse(response.body, symbolize_names: true)
            
        end
    end
end