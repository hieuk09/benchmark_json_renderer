json.name @book.name
json.genre @book.genre
json.isbn @book.isbn

json.author do
  json.name @book.author.name
  json.birthday @book.author.birthday
  json.info @book.author.info
end

json.related_books @book.latest_related_books, as: :related_books do |book|
  json.name book.name
  json.genre book.genre
  json.isbn book.isbn

  json.author do
    json.name book.author.name
    json.birthday book.author.birthday
    json.info book.author.info
  end
end
