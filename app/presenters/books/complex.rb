module Books
  class Complex < Grape::Entity
    expose :name
    expose :genre
    expose :isbn

    expose :author, using: Books::Author

    present_collection :related_books
    expose :related_books, using: Books::Simple do |item, _|
      item[:items].related_books.take(3)
    end
  end
end
