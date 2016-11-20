class Order
  attr_accessor :reader, :book, :date

  def initialize(reader, book, date = Date.today)
    raise 'Unnormed data' unless reader.instance_of?(Reader) && book.instance_of?(Book)
      @reader = reader
      @book = book
      @date = date
  end
end
