class Book < ActiveRecord::Base
  belongs_to :author

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
