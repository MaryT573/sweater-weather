class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :password, :api_key
end
