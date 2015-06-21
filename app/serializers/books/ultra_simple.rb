class Books::UltraSimple < ActiveModel::Serializer
  attributes :name, :isbn, :genre
end
