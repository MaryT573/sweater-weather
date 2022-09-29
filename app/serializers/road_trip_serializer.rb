class RoadTripSerializer
  include JSONAPI::Serializer

  def self.route(route) 
    {"data":{
      "id": nil,
      "type": "roadtrip",
      "attributes": {
        "start_city": route[:start],
        "end_city": route[:end],
        "travel_time": route[:time],
        "weather_at_eta": {
          "temperature": route[:weather].temperature,
          "conditions": route[:weather].conditions
        }
      }
    }}
  end

end
