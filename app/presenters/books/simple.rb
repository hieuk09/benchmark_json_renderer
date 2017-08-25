module Books
  class Simple < Grape::Entity
    expose :name
    expose :genre
    expose :isbn
    expose :author, using: Books::Author
  end
end
