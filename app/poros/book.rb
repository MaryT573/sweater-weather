class Book
    attr_reader :title, :isbn, :publisher, :id

    def initialize(data)
        @isbn = data[:edition_key]
        @title = data[:title]
        @publisher = data[:contributor]
        @id = nil
    end
    
end