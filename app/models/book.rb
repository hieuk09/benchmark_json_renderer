class Book < ActiveRecord::Base
  belongs_to :author
  has_many :related_books, foreign_key: 'genre', primary_key: 'genre', class_name: 'Book'
  scope :latest, -> { limit(50) }

  acts_as_api

  api_accessible :default do |template|
    template.add :id
    template.add :name
    template.add :isbn
    template.add :genre
    template.add :author, template: :default
    template.add :created_at
    template.add :updated_at
  end
end
