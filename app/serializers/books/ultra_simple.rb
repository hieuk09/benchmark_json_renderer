class Books::UltraSimple
  include FastJsonapi::ObjectSerializer
  attributes :name, :isbn, :genre
end
