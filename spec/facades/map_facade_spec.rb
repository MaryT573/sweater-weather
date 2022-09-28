require 'rails_helper'

RSpec.describe MapFacade do
    xit 'reads data from api' do
        latlong = MapFacade.find_lat_long("denver, co")          
        
        expect(latlong).to be_a Hash
        expect(latlong.count).to eq(2)
    end

    it "reads direction data and feeds into poro" do
    end
end