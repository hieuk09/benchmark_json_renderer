json.array! @books do |book|
  json.name book.name
  json.genre book.genre
  json.isbn book.isbn

  json.author do
    json.name book.author.name
    json.birthday book.author.birthday
    json.info book.author.info
  end
end
