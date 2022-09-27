require 'rails_helper'

RSpec.describe MapService do
    it 'gets data from api' do
        map = MapService.map_search("denver, co")
        map_lat_lng = map[:results][0][:locations][0][:latLng]
        
        expect(map_lat_lng).to be_a(Hash)
        expect(map_lat_lng).to eq({:lat=>39.738453, :lng=>-104.984853})
    end
end