require 'rails_helper'

RSpec.describe Forecast do
    it 'has attributes of daily weather', :vcr do
        data = WeatherFacade.forecast({:lat=>39.738453, :lng=>-104.984853})
 
        expect(data).to be_a Forecast
    end
end