require_relative '../person'
require_relative '../nameable'

describe Person do
  context 'Test the Person class' do
    person = Person.new(50, 'Blessed Jason Mwanza', true)

    it 'has class Person' do
      expect(person.class) == Person
    end

    it 'must the right name, age and permission' do
      expect(person.age).to eq 50
      expect(person.name).to eq 'Blessed Jason Mwanza'
      expect(person.parent_permission).to eq true
    end
  end
end
