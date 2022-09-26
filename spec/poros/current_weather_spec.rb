require 'rails_helper'

RSpec.describe CurrentWeather do
    it 'has attributes of current weather' do
        data = WeatherFacade.current({:lat=>39.738453, :lng=>-104.984853})
        
        expect(data).to be_a CurrentWeather
    end
end