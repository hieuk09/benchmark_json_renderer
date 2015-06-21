class Books::Simple < ActiveModel::Serializer
  attributes :name, :isbn, :genre
  has_one :author, serializer: Books::Author
end
