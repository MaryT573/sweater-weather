require 'rails_helper'

RSpec.describe 'roadtrip Endpoint' do
    describe 'get route' do 
        it 'Happy Path: gets route and weather', :vcr do
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
            
            expect(result).to be_a Hash
            expect(result[:data]).to have_key(:id)
            expect(result[:data][:type]).to eq("roadtrip")

            expect(result[:data][:attributes][:start_city]).to eq("Denver,CO")
            expect(result[:data][:attributes][:end_city]).to eq("Pueblo,CO")
            expect(result[:data][:attributes][:travel_time]).to eq("01:45:23")
            
            expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
            expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        end

        it 'Sad Path: no/wrong api key returns error', :vcr do
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
                "api_key": " "
            }
            post '/api/v1/road_trip', params: trip_params

            expect(response).to_not be_successful
            expect(response.status).to eq(401)
            expect(response.body).to eq("{\"error\":\"Wrong Key\"}")
        end

        it 'Sad Path: Impossible route', :vcr do
            user_params = {
                "username": "whatever@example.com",
                "password": "password",
                "password_confirmation": "password"
            }
            post '/api/v1/users', params: user_params

            user_result = JSON.parse(response.body, symbolize_names: true)

            trip_params = {
                "origin": "Denver,CO",
                "destination": "London,UK",
                "api_key": user_result[:data][:attributes][:api_key]
            }
            post '/api/v1/road_trip', params: trip_params

            expect(response).to_not be_successful
            expect(response.status).to eq(401)
            expect(response.body).to eq("{\"error\":\"Impossible Route\"}")
        end
    end
end