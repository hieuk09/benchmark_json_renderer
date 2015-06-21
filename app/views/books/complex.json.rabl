object @book
extends 'books/simple'
child :latest_related_books => :related_books do
  extends 'books/simple'
end
