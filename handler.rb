class DataHandler
  def initialize(file, data_to_save)
    @file_data = nil
    @json_file = file
    @data_to_save = data_to_save
    @destructured_array = nil
  end

  def create_file
    new_file = File.new(@json_file, 'w')
    new_file.puts(JSON.pretty_generate([]))
    new_file.close
  end

  def load_file_if_exists
    create_file unless File.file?(@json_file)
    @file_data = File.read(@json_file)
  end

  def append_to_array
    raise NotImplementedError
  end

  def preserve_data
    load_file_if_exists
    append_to_array

    File.open(@json_file, 'w') do |f|
      f.puts JSON.pretty_generate(@destructured_array)
    end
  end
end
