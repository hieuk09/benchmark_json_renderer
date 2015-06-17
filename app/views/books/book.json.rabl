attributes :id, :name, :isbn, :genre, :created_at, :updated_at
child :author, partial: 'books/author'
