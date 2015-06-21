object @book

attributes :name, :isbn, :genre
child :author do
  extends 'books/author'
end
