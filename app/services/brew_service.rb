class BrewService
    def self.conn
        Faraday.new(url: 'https://api.openbrewerydb.org') 
    end

    def self.brew_search(location, quantity)
        response = conn.get("/breweries") do |faraday| 
            faraday.params['location'] = location
            faraday.params['per_page'] = quantity
        end 
        JSON.parse(response.body, symbolize_names: true)
    end
end