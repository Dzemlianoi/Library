class Library
  include Loader
  attr_accessor :authors, :readers, :books, :orders

  def initialize
    @authors = []
    @books = []
    @readers = []
    @orders = []
  end

  def add(name, *items, username)
    items.each do |item|
      case item
        when Book
          books.push(item) if !books.include?(item) && authors.include?(item.author)
        when Order
          orders.push(item) if readers.include?(item.reader) && books.include?(item.book)
        when Reader
          readers.push(item) unless readers.include?(item)
        when Author
          authors.push(item) unless authors.include?(item)
        else
          raise 'Undefined element'
      end
    end
  end

  def top_reader
    sort_by(:reader).first
  end

  def top_book
    sort_by(:book).first
  end

  def top_books_statistics(number)
    raise 'Annormal quantity of books' if number > orders.count
    top_n_books = sort_by(:book, number)
    top_n_books.map{|(_,orders)| orders}.flatten.map(&:reader).uniq.count
  end

  private

  def sort_by(by, quantity = nil)
    orders.group_by(&by).max_by(quantity){|_, orders| orders.count}
  end
end
