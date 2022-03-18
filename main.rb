require './person'
require './capitalized'
require './trimmer'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = Capitalized.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = Trimmer.new(capitalized_person)
capitalized_trimmed_person.correct_name
