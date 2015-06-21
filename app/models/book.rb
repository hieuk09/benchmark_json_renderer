class Book < ActiveRecord::Base
  belongs_to :author
  has_many :related_books, foreign_key: 'genre', primary_key: 'genre', class_name: 'Book'
  scope :latest, -> { limit(50) }

  acts_as_api

  api_accessible :ultra_simple do |template|
    template.add :name
    template.add :isbn
    template.add :genre
  end

  api_accessible :simple, extend: :ultra_simple do |template|
    template.add :author, template: :default
  end

  api_accessible :complex, extend: :simple do |template|
    template.add :latest_related_books, as: :related_books, template: :simple
  end

  def latest_related_books
    related_books.take(3)
  end
end
