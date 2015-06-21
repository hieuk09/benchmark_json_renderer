class BooksController < ApplicationController
  def index
    @books = Book.latest.includes(:author, { related_books: :author })
    template = set_template
    render "#{template}_collection"
  end

  def show
    @book = Book.find(params[:id])
    template = set_template
    render partial: template, locals: { book: @book }
  end

  def set_template
    case params[:type]
    when 'ultra simple'
      'ultra_simple'
    when 'simple'
      'simple'
    when 'complex'
      'complex'
    end
  end
end
