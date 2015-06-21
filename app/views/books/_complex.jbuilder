json.name book.name
json.genre book.genre
json.isbn book.isbn

json.author book.author, partial: 'books/author', as: :author
json.related_books book.latest_related_books, as: :book, partial: 'books/simple'
