class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :info, :created_at, :updated_at
end
