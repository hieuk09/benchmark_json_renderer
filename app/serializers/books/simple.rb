class Books::Simple
  include FastJsonapi::ObjectSerializer
  attributes :name, :isbn, :genre
  has_one :author, serializer: Books::Author
end
