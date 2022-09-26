class MapFacade
    def self.find_lat_long(location)
        parsed_json = MapService.map_search(location)
        parsed_json[:results][0][:locations][0][:latLng].map do |latlong| 
            Map.new(latlong)
        end
    end
end