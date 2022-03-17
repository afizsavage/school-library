require "./decorator.rb"

class Capitalized_Decorator < Decorator
    def correct_name
        @component.correct_name.capitalize
    end
end