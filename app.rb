require './student'
require './teacher'

class App
  def initialize
    @books = []
    @people = []
  end

  def create_person
    print 'Do you want to create a student(1) a teacher(2)? [Input the number]:'
    option = gets.chomp

    case option
    when 1
      puts 'create student'
    when 2
      puts 'create teacher'
    end
  end
end
