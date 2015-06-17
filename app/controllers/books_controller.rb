class BooksController < ApplicationController
  def index
    books = Book.all.includes(:author)
    render json: books
  end
end
