class BooksController < ApplicationController
  def index
    books = Book.limit(50).includes(:author)
    render json: Oj.dump(
      ActiveModel::ArraySerializer.new(books, serializer: BookSerializer).as_json
    )
  end
end
