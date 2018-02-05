class Books::Complex
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def as_json
    {
      name: book.name,
      genre: book.genre,
      isbn: book.isbn,
      author: author.as_json,
      related_books: related_books.as_json
    }
  end

  private

  def author
    @author ||= Books::Author.new(book.author)
  end

  def related_books
    @related_books ||= book.related_books.take(3).map do |book|
      Books::Simple.new(book)
    end
  end
end
