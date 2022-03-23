require './handler'

class RentalsHandler < DataHandler
  def initialize(file, data_to_save)
    super(file, data_to_save)
    @to_save = data_to_save
  end

  def append_to_array
    @destructured_array = JSON.parse(@file_data)

    @to_save.each do |rental|
      @destructured_array << { date: rental.date, book: rental.book.title, person: rental.person.name }
    end
  end
end
