require 'rails_helper'

RSpec.describe MapFacade do
    it 'reads data from api' do
        latlong = MapFacade.find_lat_long("denver, co")          
        
        expect(latlong).to be_a Hash
        expect(latlong.count).to eq(2)
    end
end