require 'rails_helper'

RSpec.describe WeatherFacade do
    it 'gets current weather' do
        current = WeatherFacade.current({:lat=>39.738453, :lng=>-104.984853})          
        
        expect(current).to be_a Hash
        expect(current).to be_all CurrentWeather
        expect(current).to_not be_all DailyWeather
        expect(current).to_not be_all HourlyWeather
    end

    it 'gets hourly weather' do
        hourly = WeatherFacade.hourly({:lat=>39.738453, :lng=>-104.984853})          
        
        expect(hourly).to be_a Array
        expect(hourly).to be_all HourlyWeather
        expect(hourly).to_not be_all DailyWeather
        expect(hourly).to_not be_all CurrentWeather
    end

    it 'gets future weather' do
        future = WeatherFacade.future({:lat=>39.738453, :lng=>-104.984853})          
        
        expect(future).to be_a Array
        expect(future).to be_all DailyWeather
        expect(future).to_not be_all CurrentWeather
        expect(future).to_not be_all HourlyWeather
    end
end