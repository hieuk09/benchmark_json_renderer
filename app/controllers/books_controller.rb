class BooksController < ApplicationController
  def index
    books = Book.latest.includes(:author, { related_books: :author })
    klass = set_klass
    presenters = books.map do |book|
      klass.represent(book)
    end
    render json: Oj.dump(presenters.as_json)
  end

  def show
    book = Book.find(params[:id])
    klass = set_klass
    presenter = klass.represent(book)
    render json: Oj.dump(presenter.as_json)
  end

  private

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
