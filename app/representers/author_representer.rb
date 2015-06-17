require 'roar/json'
require 'roar/decorator'

class AuthorRepresenter < Roar::Decorator
  include Roar::JSON

  property :id
  property :birthday
  property :info
  property :name
  property :created_at
  property :updated_at
end


