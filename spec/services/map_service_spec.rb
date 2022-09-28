require 'rails_helper'

RSpec.describe MapService do
    it 'takes address and returns lat and long' do
        map = MapService.map_search("denver, co")
        map_lat_lng = map[:results][0][:locations][0][:latLng]
        
        expect(map_lat_lng).to be_a(Hash)
        expect(map_lat_lng).to eq({:lat=>39.738453, :lng=>-104.984853})
    end

    it 'takes a starting location and ending location and returns time' do
        map = MapService.directions( "denver, co", "Estes Park, CO" )
        
        directions = map[:route]
        
        expect(directions).to be_a(Hash)
        expect(directions[:formattedTime]).to eq("01:22:19")
        expect(directions[:hasAccessRestriction]).to eq(false)
        expect(directions[:hasCountryCross]).to eq(false)
    end
end