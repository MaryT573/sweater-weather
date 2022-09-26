require 'rails_helper'

RSpec.describe HourlyWeather do
    it 'has attributes of hourly weather' do
        data = WeatherFacade.hourly({:lat=>39.738453, :lng=>-104.984853})
        
        expect(data).to be_a HourlyWeather
    end
end