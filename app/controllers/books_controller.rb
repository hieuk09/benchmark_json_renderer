class BooksController < ApplicationController
  def index
    books = Book.all.includes(:author)
    render json: BookRepresenter.for_collection.prepare(books)
  end
end
