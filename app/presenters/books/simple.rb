class Books::Simple
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def as_json
    {
      name: book.name,
      genre: book.genre,
      isbn: book.isbn,
      author: author.as_json
    }
  end

  private

  def author
    @author ||= Books::Author.new(book.author)
  end
end
