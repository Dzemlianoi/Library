class Author
  attr_accessor :name, :biography

  def initialize(name, biography = 'No biography yet')
    @name = name
    @biography = biography
  end

  def ==(other)
    name == other.name if other.instance_of? Author
  end
end
