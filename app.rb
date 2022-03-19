require './student'
require './teacher'

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
      classroom = 'Room 1'

      puts 'New Student created successfully'
      @people << Student.new(age, name, parent_permission)

    when '2'
      puts 'create teacher'
    end
  end
end
