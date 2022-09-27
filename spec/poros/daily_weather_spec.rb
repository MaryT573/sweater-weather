require 'rails_helper'

RSpec.describe DailyWeather do
    it 'has attributes of daily weather' do
        data = {:dt=>1664301600,
            :sunrise=>1664283136,
            :sunset=>1664326167,
            :moonrise=>1664289480,
            :moonset=>1664330040,
            :moon_phase=>0.06,
            :temp=>{:day=>75.06, :min=>61.36, :max=>76.62, :night=>65.64, :eve=>73.9, :morn=>62.08},
            :feels_like=>{:day=>73.29, :night=>63.93, :eve=>72.45, :morn=>59.49},
            :pressure=>1019,
            :humidity=>22,
            :dew_point=>33.67,
            :wind_speed=>14.32,
            :wind_deg=>281,
            :wind_gust=>14.63,
            :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
            :clouds=>39,
            :pop=>0.36,
            :uvi=>5.81}
        
        daily = DailyWeather.new(data)

        expect(daily).to be_a DailyWeather
        expect(daily.conditions).to eq(data[:weather].first[:description])
        expect(daily.max_temp).to eq(data[:temp][:max])
        expect(daily.min_temp).to eq(data[:temp][:min])
        expect(daily.icon).to eq(data[:weather].first[:icon])      
    end
end