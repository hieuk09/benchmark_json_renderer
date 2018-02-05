class BooksController < ApplicationController
  def index
    books = Book.latest.includes(:author, { related_books: :author })
    klass = set_klass
    presenter = klass.new(books)
    render json: presenter.serialized_json
  end

  def show
    book = Book.find(params[:id])
    klass = set_klass
    presenter = klass.new(book)
    render json: presenter.serialized_json
  end

  def set_klass
    case params[:type]
    when 'ultra simple'
      Books::UltraSimple
    when 'simple'
      Books::Simple
    when 'complex'
      Books::Complex
    end
  end
end
