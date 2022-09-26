require 'rails_helper'

RSpec.describe BookFacade do
    it 'reads data from api' do
        books = BookFacade.search_books("denver, co")          
        
        expect(books).to be_a Array
        expect(books).to be_all Book
        expect(books.count).to eq(38)
    end
end