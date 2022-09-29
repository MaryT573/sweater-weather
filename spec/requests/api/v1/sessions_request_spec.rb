require 'rails_helper'

RSpec.describe 'Sessions Endpoint' do
  describe 'Login' do
    it 'checks for exisiting user', :vcr do
        user_params = {
            "username": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
        }
        post '/api/v1/users', params: user_params

        user_params = {
            "username": "whatever@example.com",
            "password": "password",
        }
        post '/api/v1/sessions', params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        result = JSON.parse(response.body, symbolize_names: true)
      
        expect(result).to be_a Hash
        expect(result[:data]).to have_key(:id)
        expect(result[:data][:type]).to eq("users")

        expect(result[:data][:attributes][:username]).to eq(user_params[:username])
        expect(result[:data][:attributes][:api_key]).to be_a String
    end

    it 'fails if password doesnt match', :vcr do
        user_params = {
            "username": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
        }
        post '/api/v1/users', params: user_params

        user_params = {
            "username": "whatever@example.com",
            "password": "wrong",
        }
        post '/api/v1/sessions', params: user_params

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(response.body).to eq("{\"error\":\"Incorrect Credentials\"}")
    end
  end
end