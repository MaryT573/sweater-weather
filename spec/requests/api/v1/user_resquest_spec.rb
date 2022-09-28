require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  describe 'Happy Path Sign Up' do
    it 'Posts a new user to the database' do
      user_params = {
          "username": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
      }

      post '/api/v1/users', params: user_params
      
      expect(response).to be_successful
      expect(response.status).to eq(201)

      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to be_a Hash
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:type]).to eq("users")

      expect(result[:data][:attributes][:username]).to eq(user_params[:username])
      expect(result[:data][:attributes][:api_key]).to be_a String
    end
  end
end