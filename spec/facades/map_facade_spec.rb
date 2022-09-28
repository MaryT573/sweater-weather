require 'rails_helper'

RSpec.describe MapFacade do
    it 'reads data from api' do
        latlong = MapFacade.find_lat_long("denver, co")          
        
        expect(latlong).to be_a Hash
        expect(latlong.count).to eq(2)
    end

    it "reads direction data and feeds into poro" do
        map = MapFacade.route( "denver, co", "Estes Park, CO" )
         
        expect(map).to be_a RoadTrip
        expect(map.blocked).to eq(false)
        expect(map.bordercrossing).to eq(false)
        expect(map.time).to eq("01:22:19")
    end
end