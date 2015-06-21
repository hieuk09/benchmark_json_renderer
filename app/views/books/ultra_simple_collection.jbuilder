json.array! @books do |book|
  json.name book.name
  json.genre book.genre
  json.isbn book.isbn
end
