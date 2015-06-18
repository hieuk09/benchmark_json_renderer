class BooksController < ApplicationController
  def index
    books = Book.limit(50).includes(:author)
    render json: Oj.dump(books.as_json)
  end
end
