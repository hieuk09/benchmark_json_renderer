class Books::UltraSimple
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def as_json
    {
      name: book.name,
      genre: book.genre,
      isbn: book.isbn
    }
  end
end
