class BrewerySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :brewery_type
end
