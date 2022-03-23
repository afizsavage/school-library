require './teacher'
require './book'
require './rental'
require './creator'
require 'json'
require './book_handler'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
      student = PersonCreator.new('student')
      @people << student.create_person
    when '2'
      teacher = PersonCreator.new('teacher')
      @people << teacher.create_person
    else
      puts 'Wrong input!'
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

  # def preserve_data
  #   if File.file?('./books.json')
  #     json = File.read('./books.json')
  #   else
  #     new_file = File.new('./books.json', 'w')
  #     new_file.puts(JSON.pretty_generate([]))
  #     new_file.close
  #     json = File.read('./books.json')
  #   end

  #   second_json_array = JSON.parse(json)

  #   @books.each do |book|
  #     second_json_array << { title: book.title, author: book.author }
  #   end

  #   File.open('./books.json', 'w') do |f|
  #     f.puts JSON.pretty_generate(second_json_array)
  #   end
  # end

  def save_data
    book_hand = BookHandler.new('./books.json', @books)
    book_hand.preserve_data
  end
end
