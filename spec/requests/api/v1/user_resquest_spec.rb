require 'rails_helper'

RSpec.describe 'User Request' do
    xit 'gets response with brewery data and weather data' do
        post '/api/v1/users/'
        
        expect(response).to be_successful

        breweries = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(breweries).to be_a Hash

        expect(breweries[:id]).to eq(nil)
        expect(breweries[:type]).to eq("breweries")
        expect(breweries[:attributes][:destination]).to eq("denver")

        expect(breweries[:attributes][:forcast]).to have_key(:summary)
        expect(breweries[:attributes][:forcast]).to have_key(:temperature)
        expect(breweries[:attributes][:forcast]).to_not have_key(:datetime)
        expect(breweries[:attributes][:forcast]).to_not have_key(:name)

        expect(breweries[:attributes][:breweries].count).to eq(5)
        expect(breweries[:attributes][:breweries].first).to have_key(:id)
        expect(breweries[:attributes][:breweries].first).to have_key(:name)
        expect(breweries[:attributes][:breweries].first).to have_key(:brewery_type)
        expect(breweries[:attributes][:breweries].first).to_not have_key(:street)
        expect(breweries[:attributes][:breweries].first).to_not have_key(:summary)
    end
end