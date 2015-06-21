class Author < ActiveRecord::Base

  acts_as_api

  api_accessible :default do |template|
    template.add :name
    template.add :birthday
    template.add :info
  end
end
