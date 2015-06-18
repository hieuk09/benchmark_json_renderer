class BooksController < ApplicationController
  def index
    @books = Book.limit(50).includes(:author)
  end
end
