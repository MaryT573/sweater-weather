class Book
    attr_reader :title, :isbn, :publisher, :id, :current_weather

    def initialize(data)
        #@current_weather = WeatherFacade.current(data[:publish_place])
        @isbn = data[:edition_key]
        @title = data[:title]
        @publisher = data[:contributor]
        @id = nil 
    end
    
end