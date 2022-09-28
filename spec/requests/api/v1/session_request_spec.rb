require 'rails_helper'

RSpec.describe 'Sessions Endpoint' do
  describe 'Login' do
    it 'checks for exisiting user' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
          "username": "whatever@example.com",
          "password": "password"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)
      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to be_a Hash
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:type]).to eq("users")

      expect(result[:data][:attributes][:username]).to eq(user_params[:username])
      expect(result[:data][:attributes][:api_key]).to be_a String
    end
  end
end