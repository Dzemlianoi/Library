class Library
  include Loader
  attr_accessor :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def add(*items)
    items.each do |item|
      case item
        when Book
          @books.push(item) if !@books.include?(item) && @authors.include?(item.author)
        when Order
          @orders.push(item) if @readers.include?(item.reader) && @books.include?(item.book)
        when Reader
          @readers.push(item) unless @readers.include?(item)
        when Author
          @authors.push(item) unless @authors.include?(item)
        else
          raise 'Undefined element'
      end
    end
  end

  def top_reader
    top_of(:reader).first
  end

  def top_book
    top_of(:book).first
  end

  def top_books_statistics(number)
    raise 'Annormal quantity of books' if number > top_of(:book).count
    top_books_readers = []
    first_n_books = top_of(:book).first(number)
    groups_by_book = grouping_by(:book)
    first_n_books.each do |book|
      groups_by_book[book].each do |order|
        top_books_readers.push(order.reader)
      end
    end
    top_books_readers.uniq.size
  end

  private

  def grouping_by(flag)
    @orders.group_by do |order|
      order.public_send(flag)
    end
  end

  def sort_grouped(data)
    sorted = data.sort_by { |_, v| v.size }
    sorted.reverse.to_h
  end

  def top_of(flag)
    grouped_orders = grouping_by(flag)
    sorted_orders = sort_grouped(grouped_orders)
    sorted_orders.keys
  end
end
