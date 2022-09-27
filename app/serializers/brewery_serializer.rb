class BrewerySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :brewery_type

  def self.format_response(data)
    {
      "data": {
        "id": nil,
        "type": "breweries",
        "attributes": {
          "destination": data[:location],
          "forcast": {
            "summary": data[:current_weather].conditions,
            "temperature": data[:current_weather].temperature
          },
          "breweries": data[:breweries].each do |brewery|
            {
              "id": brewery.id,
              "name": brewery.name,
              "brewery_type": brewery.brewery_type
            }
          end
        }
      }
    }
  end
end
