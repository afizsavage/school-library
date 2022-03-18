require "./person.rb"
require "./capitalized.rb"
require "./trimmer.rb"

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = Capitalized.new(person)
capitalizedPerson.correct_name
capitalizedTrimmedPerson = Trimmer.new(capitalizedPerson)
capitalizedTrimmedPerson.correct_name
