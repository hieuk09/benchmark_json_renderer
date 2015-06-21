require 'roar/json'
require 'roar/decorator'

class Books::UltraSimple < Roar::Decorator
  include Roar::JSON

  property :isbn
  property :genre
  property :name
end

