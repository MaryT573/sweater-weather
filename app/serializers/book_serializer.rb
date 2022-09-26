class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :publisher, :isbn
end
