class Books::Author < ActiveModel::Serializer
  attributes :name, :birthday, :info
end
