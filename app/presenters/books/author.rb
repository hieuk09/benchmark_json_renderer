class Books::Author
  attr_reader :author

  def initialize(author)
    @author = author
  end

  def as_json
    {
      name: author.name,
      birthday: author.birthday,
      info: author.info
    }
  end
end
