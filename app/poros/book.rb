class Book
    attr_reader :title, :isbn, :publisher

    def initialize(data)
        @isbn = data[:edition_key]
        @title = data[:title]
        @publisher = data[:contributor]
    end
    
end