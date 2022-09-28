require 'rails_helper'

RSpec.describe HourlyWeather do
    it 'has attributes of hourly weather' do
        data = {:dt=>1664316000,
            :temp=>73.17,
            :feels_like=>71.73,
            :pressure=>1020,
            :humidity=>33,
            :dew_point=>42.39,
            :uvi=>2.49,
            :clouds=>71,
            :visibility=>10000,
            :wind_speed=>10.04,
            :wind_deg=>190,
            :wind_gust=>13.29,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
            :pop=>0.24}
        
        hourly = HourlyWeather.new(data)
         
        expect(hourly).to be_a HourlyWeather
        expect(hourly.conditions).to eq(data[:weather].first[:description])
        expect(hourly.icon).to eq(data[:weather].first[:icon])
        expect(hourly.temperature).to eq(data[:temp])
    end
end