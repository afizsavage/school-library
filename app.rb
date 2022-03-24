require './teacher'
require './book'
require './rental'
require './creator'
require 'json'
require './book_handler'
require './people_handler'
require './rentals_dandler'

class App
  def initialize
    @books = []
    @newly_created_books = []
    @people = []
    @newly_created_people = []
    @rentals = []
    @book_handler = BookHandler.new('./books.json', @newly_created_books)
    @people_handler = PeopleHandler.new('./people.json', @newly_created_people)
    @rentals_handler = RentalsHandler.new('./rentals.json', @rentals)
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student(1) a teacher(2)? [Input number]:'
    option = gets.chomp

    case option
    when '1'
      student = PersonCreator.new('student').create_person
      @newly_created_people << student
      @people << student
    when '2'
      teacher = PersonCreator.new('teacher').create_person
      @newly_created_people << teacher
      @people << teacher
    else
      puts 'Wrong input!'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author : '
    author = gets.chomp

    book = Book.new(title, author)

    @newly_created_books << book
    @books << book
    puts 'Book created sucessfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "(#{index}) - Title: #{book.title}, Author: #{book.author}"
    end

    selected_book = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "[#{index}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end

    selected_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[selected_book], @people[selected_person])

    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'Enter person id '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title}, Person: #{rental.person.name}"
      end
    end
  end

  def load_books
    @book_handler.files_to_load.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def load_people
    @people_handler.files_to_load.each do |person|
      @people << if person['class'] == 'Student'
                   PersonCreator.new('student', person['age'], person['name']).create_person
                 else
                   PersonCreator.new('teacher', person['age'], person['name']).create_person
                 end
    end
  end

  def load_files_if_exists
    load_books unless @book_handler.files_to_load.nil?
    load_people unless @people_handler.files_to_load.nil?
  end

  def save_data
    @book_handler.preserve_data
    @people_handler.preserve_data
    @rentals_handler.preserve_data
  end
end
