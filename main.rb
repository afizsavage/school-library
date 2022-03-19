#!/usr/bin/env ruby

class MainEntryPoint
  def initialize
    @option = nil
  end

  def print_options
    puts
    puts ['1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
          '5 - Create a rental', '6 - List all rentals for a given person', '7 - Exit']
  end

  def choose_options
    @option = gets.chomp
  end

  def process_option
    @option == 7 ? exit : @option
  end

  def run
    puts 'Welcome to School Library App!'
    print_options
    choose_options
    process_option
  end
end

def main
  app = MainEntryPoint.new
  app.run
end

main
