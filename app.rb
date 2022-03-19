require './student'
require './teacher'
require './book'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_all_people
    puts @people
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
    print "Title :"
    title = gets.chomp
    
    print "Author :"
    author = gets.chomp

    @books << Book.new(title, author)
    puts "Book created sucessfully"
  end
end
