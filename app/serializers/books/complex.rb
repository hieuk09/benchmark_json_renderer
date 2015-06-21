class Books::Complex < ActiveModel::Serializer
  attributes :name, :isbn, :genre
  has_one :author, serializer: Books::Author
  has_many :related_books, serializer: Books::Simple

  def related_books
    object.related_books.take(3)
  end
end
