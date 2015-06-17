class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :isbn, :genre, :created_at, :updated_at

  has_one :author, serializer: AuthorSerializer
end
