class BookService
    def self.conn
        Faraday.new(url: 'https://openlibrary.org') 
    end

    def self.city_search(location)
        response = conn.get("/search.json?title=#{location}") 
        JSON.parse(response.body, symbolize_names: true) 
    end
end