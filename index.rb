require 'yaml'
Dir['./lib/*.rb'].each { |file| require file }

library = Library.new
library.load('library')
author1 = Author.new('J. Roaling', 'Hi')
author2 = Author.new('S. King', 'Hello')
author3 = Author.new('M. Molier', 'Hello')
author4 = Author.new('G. Martin', 'Hello')
author5 = Author.new('M. Tven', 'Hello')
author6 = Author.new('F. Kafka', 'Hello')
author7 = Author.new('R. Somsmert', 'Hello')
#
library.add_authors(author1, author2, author3, author4, author5, author6, author7)
#
book = Book.new('Harry Potter I', author1)
book1 = Book.new('Harry Potter II', author1)
book2 = Book.new('Harry Potter III', author1)
book3 = Book.new('Dark Tower', author2)
book4 = Book.new('Mizo', author3)
book5 = Book.new('Game of thrones I', author4)
book6 = Book.new('Game of thrones II', author4)
book6 = Book.new('Tom Sawyer', author5)
book7 = Book.new('All about us', author7)
#
library.add_books(book, book1, book2, book3, book4, book5, book6, book7)
#
reader1 = Reader.new('Denis', 'dzem@gmail.com', 'Dnipro', 'GS', 140)
reader2 = Reader.new('Test', 'test@gmail.com', 'Kiev', 'KM', 101)
reader3 = Reader.new('Testovskiy', 'testovskiy@gmail.com', 'Uzhgorod', 'KL', 22)
reader4 = Reader.new('Testarius', 'testarius@gmail.com', 'Odessa', 'BH', 71)
reader5 = Reader.new('Testevich', 'testarich@gmail.com', 'Kharkiv', 'YM', 41)
library.add_readers(reader1, reader2, reader3, reader4, reader5)
#
order = Order.new(library.readers[0], library.books[0])
order1 = Order.new(library.readers[4], library.books[1])
order2 = Order.new(library.readers[1], library.books[2])
order3 = Order.new(library.readers[2], library.books[3])
order4 = Order.new(library.readers[3], library.books[4])
order5 = Order.new(library.readers[4], library.books[5])
order6 = Order.new(library.readers[4], library.books[3])
order7 = Order.new(library.readers[0], library.books[3])
order8 = Order.new(library.readers[3], library.books[3])
order9 = Order.new(library.readers[2], library.books[2])
order10 = Order.new(library.readers[1], library.books[1])

# library.add_orders(order,order1,order2,order3,order4,order5,order6,order7,order8,order9,order10)

library.save('library')

puts library.top_reader.name
puts library.top_book.title
puts library.top_books_statistics(3)

# puts 'Books -------------------'
# puts library.books.inspect
# puts 'Authors -----------------'
# puts library.authors.inspect
# puts 'Readers -----------------'
# puts library.readers.inspect
# puts 'Orders ------------------'
# puts library.orders.inspect
