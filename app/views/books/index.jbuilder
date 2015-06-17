json.array! @books do |book|
  json.name book.name
  json.genre book.genre
  json.isbn book.isbn
  json.id book.id
  json.created_at book.created_at
  json.updated_at book.updated_at

  json.author do
    json.name book.author.name
    json.birthday book.author.birthday
    json.info book.author.info
    json.created_at book.author.created_at
    json.updated_at book.author.updated_at
  end
end
