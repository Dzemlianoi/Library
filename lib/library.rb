class Library
  include Loader
  attr_accessor :authors, :readers, :books, :orders
  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def add_books(*books)
    books.each do |book|
      @books.push(book) if check(book, Book, @books) && @authors.include?(book.author)
    end
  end

  def add_authors(*authors)
    authors.each do |author|
      @authors.push(author) if check(author, Author, @authors)
    end
  end

  def add_readers(*readers)
    readers.each do |reader|
      @readers.push(reader) if check(reader, Reader, @readers)
    end
  end

  def add_orders(*orders)
    orders.each do |order|
      if @readers.include?(order.reader) && @books.include?(order.book)
        @orders.push(order)
      else
        raise 'No such reader or Book in the Library'
      end
    end
  end

  def check(item, type, collection)
    item.is_a?(type) && !collection.include?(item)
  end

  def grouping_by(flag)
    @orders.group_by do |order|
      order.public_send(flag)
    end
  end

  def sort_grouped(data)
    sorted = data.sort_by{ |k,v| v.size }
    sorted.reverse.to_h
  end

  def top_of(flag)
    grouped_orders = grouping_by(flag)
    sorted_orders = sort_grouped(grouped_orders)
    sorted_orders.keys
  end

  def top_reader
    top_of(:reader).first
  end

  def top_book
    top_of(:book).first
  end

  def top_books_statistics(number)
    top_books_readers = []
    raise 'Annormal quantity of books' if number > top_of(:book).count
    first_n_books = top_of(:book).first(number)
    books_data = grouping_by(:book)
    first_n_books.each do |book|
      books_data[book].each do |order|
        top_books_readers.push(order.reader)
      end
    end
    top_books_readers.uniq.size
  end
end
