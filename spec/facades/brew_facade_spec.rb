require 'rails_helper'

RSpec.describe BrewFacade do
    it 'feeds data from service into poro' do
        brew = BrewFacade.get_brew({:lat=>39.738453, :lng=>-104.984853}, 5)          
         
        expect(brew).to be_a Array
        expect(brew.count).to eq(5)
    end
end