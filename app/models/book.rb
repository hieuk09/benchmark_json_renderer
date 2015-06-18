class Book < ActiveRecord::Base
  belongs_to :author

  def as_json(*args)
    super.merge(
      author: author.as_json
    )
  end
end
