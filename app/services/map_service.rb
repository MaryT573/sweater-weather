class MapService
    def self.conn
        Faraday.new(url: 'http://www.mapquestapi.com') 
    end

    def self.map_search(location)
        response = conn.get("/geocoding/v1/address") do |faraday|
            faraday.params['key'] = ENV['map_key']
            faraday.params['location'] = location
        end 
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.directions(from, to)
        response = conn.get("directions/v2/route") do |faraday|
            faraday.params['key'] = ENV['map_key']
            faraday.params['from'] = from
            faraday.params['to'] = to
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end