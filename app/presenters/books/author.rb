module Books
  class Author < Grape::Entity
    expose :name
    expose :birthday
    expose :info
  end
end
