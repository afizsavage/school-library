require './handler'

class BookHandler < DataHandler
  def initialize(file, data_to_save)
    super(file, data_to_save)
    @to_save = data_to_save
  end

  def append_to_array
    @destructured_array = JSON.parse(@file_data)

    @to_save.each do |book|
      @destructured_array << { title: book.title, author: book.author }
    end
  end
end
