class Author < ActiveRecord::Base

  acts_as_api

  api_accessible :default do |template|
    template.add :id
    template.add :name
    template.add :birthday
    template.add :info
    template.add :created_at
    template.add :updated_at
  end
end
