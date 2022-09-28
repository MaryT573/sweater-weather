require 'rails_helper'

RSpec.describe RoadTrip do
    it 'has a roadtrip data' do
        data = {:hasTollRoad=>false,
            :hasBridge=>true,
            :distance=>70.55,
            :hasTimedRestriction=>false,
            :hasTunnel=>false,
            :hasHighway=>true,
            :computedWaypoints=>[],
            :routeError=>{:errorCode=>-400, :message=>""},
            :formattedTime=>"01:22:19",
            :sessionId=>"6334b62c-0332-5f21-02b4-3852-0256accb1c6f",
            :hasAccessRestriction=>false,
            :realTime=>5964,
            :hasSeasonalClosure=>false,
            :hasCountryCross=>false,
            :fuelUsed=>3.27}
        
        route = RoadTrip.new(data)
         
        expect(route.time).to eq(data[:formattedTime])
        expect(route.bordercrossing).to eq(data[:hasCountryCross])
        expect(route.blocked).to eq(data[:hasAccessRestriction])
    end
end