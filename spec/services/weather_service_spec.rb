require 'rails_helper'

RSpec.describe WeatherService do
    it 'gets data from api' do
        weather = WeatherService.get_weather
       
        expect(movie[:results][0]).to be_a(Hash)
        expect(movie[:results][0][:title]).to be_a(String)
    end
end