require 'rails_helper'

RSpec.describe DailyWeather do
    it 'has attributes of daily weather' do
        data = WeatherFacade.future({:lat=>39.738453, :lng=>-104.984853})
        require 'pry'; binding.pry 
        expect(data).to be_a Array
    end
end