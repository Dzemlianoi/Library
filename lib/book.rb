class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def ==(other)
    check_author(other) && check_title(other) if other.is_a? Book
  end

  def check_author(other)
    author == other.author
  end

  def check_title(other)
    title == other.title
  end
end
