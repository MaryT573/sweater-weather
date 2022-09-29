require 'rails_helper'

RSpec.describe BrewService do
    it 'returns list of breweries near these coordinates', :vcr do
        breweries = BrewService.brew_search({:lat=>39.738453, :lng=>-104.984853}, 5)
         
        expect(breweries).to be_a(Array)
        expect(breweries.count).to eq(5)
    end
end