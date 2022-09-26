class BookFacade
    def self.search_books(location)
        parsed_json = BookService.city_search(location) 
        parsed_json[:docs].map do |books| 
            Book.new(books)
        end
    end
end