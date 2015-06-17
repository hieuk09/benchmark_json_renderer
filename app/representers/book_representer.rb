require 'roar/json'
require 'roar/decorator'

class BookRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :isbn
  property :genre
  property :name
  property :created_at
  property :updated_at
  property :author, extend: AuthorRepresenter
end

