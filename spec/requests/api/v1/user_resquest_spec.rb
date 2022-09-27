require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  describe 'Happy Path Sign Up' do
    it 'Posts a new user to the database' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_params = {
        "username": 'ben@ben.com',
        "password": "ben123",
        "password_confirmation": "ben123"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      result = JSON.parse(response.body, symbolize_names: true)
    end
end