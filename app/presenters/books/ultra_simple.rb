module Books
  class UltraSimple < Grape::Entity
    expose :name
    expose :genre
    expose :isbn
  end
end
