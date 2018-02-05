class Books::Author
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthday, :info
end
