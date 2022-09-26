require 'rails_helper'

RSpec.describe BookService do
    it 'gets data from api' do
        book = BookService.city_search("denver, co")
        books_returned = book[:docs]
        
        expect(books_returned).to be_a(Array)
        expect(books_returned.count).to eq(38)
        expect(books_returned.first[:title]).to be_a(String)
    end
end