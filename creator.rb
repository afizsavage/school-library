require './student'
require './teacher'

class PersonCreator
  def initialize(type, age = nil, name = nil)
    @age = age
    @name = name
    @person = nil
    @type = type
  end

  def receive_general_info
    print 'Age '
    @age = gets.chomp

    print 'Name '
    @name = gets.chomp
  end

  def receive_additional_info
    if @type == 'student'
      print 'Parent permission '
      has_permission = gets.chomp
      parent_permission = has_permission.include? 'Yy'
      @person = Student.new(@age, @name, parent_permission)
    else
      print 'Specialization '
      received_specialization = gets.chomp
      specialization = received_specialization
      @person = Teacher.new(@age, @name, specialization)
    end
  end

  def generate_details
    @person = if @type == 'student'
                Student.new(@age, @name, nil)
              else
                Teacher.new(@age, @name, nil)
              end
  end

  def request_details
    receive_general_info
    receive_additional_info
  end

  def create_person
    if @age.nil?
      request_details
    else
      generate_details
    end

    puts 'Person created successfully'
    @person
  end
end
