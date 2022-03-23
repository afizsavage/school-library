require './handler'

class PeopleHandler < DataHandler
  def initialize(file, data_to_save)
    super(file, data_to_save)
    @to_save = data_to_save
  end

  def append_to_array
    @destructured_array = JSON.parse(@file_data)

    @to_save.each do |person|
      @destructured_array << { class: person.class, id: person.id, name: person.name, age: person.age }
    end
  end
end
