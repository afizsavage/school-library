class DataHandler
  def initialize(file, data_to_save)
    @file_data = nil
    @json_file = file
    @data_to_save = data_to_save
    @destructured_array = nil
  end

  def load_files
    file_to_load = File.read(@json_file)
    JSON.parse(file_to_load)
  end

  def files_to_load
    load_files unless File.file?(@json_file) == false
  end

  def create_file
    new_file = File.new(@json_file, 'w')
    new_file.puts(JSON.pretty_generate([]))
    new_file.close
  end

  def read_file_if_it_exists
    create_file unless File.file?(@json_file)
    @file_data = File.read(@json_file)
  end

  def append_to_array
    raise NotImplementedError
  end

  def preserve_data
    read_file_if_it_exists
    append_to_array

    File.open(@json_file, 'w') do |f|
      f.puts JSON.pretty_generate(@destructured_array)
    end
  end
end
