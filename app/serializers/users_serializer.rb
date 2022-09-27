class UsersSerializer
  include JSONAPI::Serializer
  attributes :username, :api_key
end
