require 'rails_helper'

RSpec.describe WeatherService do
    it 'returns data from api based on lat and long' do
        location = {:lat=>39.738453, :lng=>-104.984853}
        weather = WeatherService.get_weather(location)
        weather_now = weather[:current]
        weather_then = weather[:daily]
        weather_hourly = weather[:hourly]
         
        expect(weather_now).to be_a(Hash)
        expect(weather_then).to be_a(Array)
        expect(weather_hourly).to be_a(Array)
        expect(weather_then.count).to eq(8)
        expect(weather_hourly.count).to eq(48)
    end
end