class Books::Complex < Books::Simple
  collection :related_books, exec_context: :decorator, extend: Books::Simple

  def related_books
    represented.related_books.take(3)
  end
end

