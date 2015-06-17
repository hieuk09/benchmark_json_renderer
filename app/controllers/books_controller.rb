class BooksController < ApplicationController
  def index
    @books = Book.all.includes(:author)
  end
end
