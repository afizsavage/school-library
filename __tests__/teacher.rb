require_relative '../teacher'

describe Teacher do
  context 'Testing the Teacher class' do
    teacher = Teacher.new(60, 'Math', 'teacher1')

    it 'has the class of Teacher' do
      expect(teacher.instance_of?(Teacher)) == true
    end

    it 'should have the right name - teacher1, age = 60 and specialization - math' do
      expect(teacher.age).to eq 60
      expect(teacher.name).to eq 'teacher1'
      expect(teacher.specialization).to eq 'Math'
    end

    it 'should be able to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
