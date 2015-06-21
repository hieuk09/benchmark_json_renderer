json.array! @books do |book|
  json.name book.name
  json.genre book.genre
  json.isbn book.isbn

  json.author book.author, partial: 'books/author', as: :author
end
