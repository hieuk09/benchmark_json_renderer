object @book

attributes :name, :isbn, :genre
child :author do
  extends 'books/author'
end

child :latest_related_books => :related_books do
  extends 'books/simple'
end
