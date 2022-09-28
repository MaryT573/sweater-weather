require 'rails_helper'

RSpec.describe CurrentWeather do
    it 'has attributes of current weather' do
        data = {:dt=>1664316103,
            :sunrise=>1664283136,
            :sunset=>1664326167,
            :temp=>74.3,
            :feels_like=>73.02,
            :pressure=>1021,
            :humidity=>34,
            :dew_point=>44.15,
            :uvi=>2.49,
            :clouds=>77,
            :visibility=>10000,
            :wind_speed=>4,
            :wind_deg=>315,
            :wind_gust=>11.99,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}]}
        
        current = CurrentWeather.new(data)
        
        expect(current).to be_a CurrentWeather
        expect(current.conditions).to eq(data[:weather].first[:description])
        expect(current.feels_like).to eq(data[:feels_like])
        expect(current.humidity).to eq(data[:humidity])
        expect(current.temperature).to eq(data[:temp])
        expect(current.uvi).to eq(data[:uvi])
        expect(current.icon).to eq(data[:weather].first[:icon])
        expect(current.visibility).to eq(data[:visibility])
    end
end