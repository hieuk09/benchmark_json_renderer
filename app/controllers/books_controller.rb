class BooksController < ApplicationController
  def index
    books = Book.all.includes(:author)
    render json: ActiveModel::ArraySerializer.new(books, serializer: BookSerializer)
  end
end
