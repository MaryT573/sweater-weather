class MapFacade
    def self.find_lat_long(location)
        parsed_json = MapService.map_search(location)
        result = parsed_json[:results][0][:locations][0][:latLng]
    end

    def self.route(from, to)
        parsed_json = MapService.directions(from, to) 
        RoadTrip.new(parsed_json[:route])
    end
end