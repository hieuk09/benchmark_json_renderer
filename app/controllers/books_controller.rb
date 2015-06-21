class BooksController < ApplicationController
  def index
    books = Book.latest.includes(:author, { related_books: :author })
    klass = set_klass
    render json: klass.for_collection.prepare(books)
  end

  def show
    book = Book.find(params[:id])
    klass = set_klass
    render json: klass.prepare(book)
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
