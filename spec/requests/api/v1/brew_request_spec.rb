require 'rails_helper'

RSpec.describe 'Brewery Request' do
    it 'gets response with brewery data and weather data' do
        get 'api/v1/breweries', params: { location: "denver, co", quantity: 5}
        expect(response).to be_successful
    end
end