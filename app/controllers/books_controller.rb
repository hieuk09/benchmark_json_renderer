class BooksController < ApplicationController
  def index
    books = Book.limit(50).includes(:author)
    render json: BookRepresenter.for_collection.prepare(books)
  end
end
