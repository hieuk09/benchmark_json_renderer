class Book < ActiveRecord::Base
  belongs_to :author
  has_many :related_books, foreign_key: 'genre', primary_key: 'genre', class_name: 'Book'
  scope :latest, -> { limit(50) }
end
