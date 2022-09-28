require 'rails_helper'

RSpec.describe HourlyWeather do
    it 'has attributes of hourly weather' do
        data = {:dt=>1664409600,
            :temp=>81.79,
            :feels_like=>79.65,
            :pressure=>1016,
            :humidity=>18,
            :dew_point=>34.2,
            :uvi=>0.25,
            :clouds=>47,
            :visibility=>10000,
            :wind_speed=>12.91,
            :wind_deg=>167,
            :wind_gust=>11.14,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
            :pop=>0}
        
        hourly = WeatherEta.new(data)
         
        expect(hourly).to be_a WeatherEta
        expect(hourly.conditions).to eq(data[:weather].first[:description])
        expect(hourly.temperature).to eq(data[:temp])
    end
end