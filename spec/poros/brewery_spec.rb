require 'rails_helper'

RSpec.describe Brewery do
    it 'has a brewery data' do
        data = {:id=>"10-56-brewing-company-knox",
            :name=>"10-56 Brewing Company",
            :brewery_type=>"micro",
            :street=>"400 Brown Cir",
            :address_2=>nil,
            :address_3=>nil,
            :city=>"Knox",
            :state=>"Indiana",
            :county_province=>nil,
            :postal_code=>"46534",
            :country=>"United States",
            :longitude=>"-86.627954",
            :latitude=>"41.289715",
            :phone=>"6308165790",
            :website_url=>nil,
            :updated_at=>"2022-08-20T02:56:08.975Z",
            :created_at=>"2022-08-20T02:56:08.975Z"}
        
        brew = Brewery.new(data)
         
        expect(brew.name).to eq(data[:name])
        expect(brew.id).to eq(data[:id])
        expect(brew.brewery_type).to eq(data[:brewery_type])
    end
end