require_relative '../classroom'

describe Classroom do
  context 'Test Classroom class' do
    classroom = Classroom.new('Programming')

    it 'must has the class classroom' do
      expect(classroom.class) == Classroom
    end

    it 'needs to have the right label' do
      expect(classroom.label).to eq 'Programming'
    end
  end
end
