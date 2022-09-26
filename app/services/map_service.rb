class MapService
    def self.conn
        Faraday.new(url: 'http://www.mapquestapi.com') 
    end

    def self.map_data
        response = conn.get("/geocoding/v1/address") do |faraday|
            faraday.params['key'] = ENV['map_key']
        end 
        JSON.parse(response.body, symbolize_names: true)
    end
end