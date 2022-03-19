require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts @books
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student(1) a teacher(2)? [Input tNhe number]:'
    option = gets.chomp

    case option
    when '1'
      print 'Age '
      age = gets.chomp

      print 'Name '
      name = gets.chomp

      print 'Has parent permission? [Y/N]: '
      has_permission = gets.chomp
      parent_permission = has_permission.include? 'Yy'

      @people << Student.new(age, name, parent_permission)
      puts 'Person created successfully'

    when '2'
      print 'Age '
      age = gets.chomp

      print 'Name '
      name = gets.chomp

      print 'Specialization '
      specialization = gets.chomp

      @people << Teacher.new(age, specialization, name)
      puts 'Person created successfully'

    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author : '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created sucessfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "(#{index}) - Title: #{book.title}, Author: #{book.author}"
    end

    selected_book = gets.chomp
    book_to_rent = @books.index(selected_book)

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "[#{index}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    selected_person = gets.chomp
    person_who_rented = @people.index(selected_person)

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, book_to_rent, person_who_rented)
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts @rentals
  end
end
