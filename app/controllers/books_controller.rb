class BooksController < ApplicationController
  def index
    books = Book.latest.includes(:author, { related_books: :author })
    klass = set_klass
    render json: Oj.dump(books.as_api_response(klass))
  end

  def show
    book = Book.find(params[:id])
    klass = set_klass
    render json: Oj.dump(book.as_api_response(klass))
  end

  def set_klass
    case params[:type]
    when 'ultra simple'
      :ultra_simple
    when 'simple'
      :simple
    when 'complex'
      :complex
    end
  end
end
