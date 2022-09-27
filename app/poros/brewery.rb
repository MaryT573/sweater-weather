class Brewery
    attr_reader :id, :name, :brewery_type
                
    def initialize(data)
        @id = data[:id]
    end
end