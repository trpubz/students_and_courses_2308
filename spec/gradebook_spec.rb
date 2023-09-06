require 'rspec'
require './lib/gradebook'
require './lib/course'
require './lib/student'

RSpec.describe Gradebook do
  describe '#initialize' do
    it 'exists' do
      gradebook = Gradebook.new("TP")
      expect(gradebook).to be_a Gradebook
    end
  end

  describe '@attributes' do
    it 'has attributes' do
      gradebook = Gradebook.new("TP")
      expect(gradebook.instructor).to eq "TP"
      expect(gradebook.courses).to eq []
    end
  end

  describe '#add_course' do
    it 'adds courses' do
      gradebook = Gradebook.new("TP")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)
      course.enroll(student2)
      gradebook.add_course(course)
      expect(gradebook.courses.size).to eq 1
    end
  end

  describe '#list_all_students' do
    it 'returns a Hash of Course => Students' do
      gradebook = Gradebook.new("TP")
      course = Course.new("Calculus", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)
      course.enroll(student2)
      gradebook.add_course(course)
      expect(gradebook.list_all_students).to eq({ course => [student1, student2] })
    end
  end

  describe '#students_below' do
    it 'returns a list of students below threshold' do
      gradebook = Gradebook.new("TP")
      course = Course.new("Calculus", 2)
      course2 = Course.new("Maths", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)
      course.enroll(student2)
      course2.enroll(student2)
      gradebook.add_course(course)
      student1.log_score(course.name, 69)
      student2.log_score(course.name, 82)
      student2.log_score(course2.name ,26)
      expect(gradebook.students_below(75)).to eq [student1, student2]
    end
  end

  describe '#all_grades' do
    it 'returns hash Course => Scores for course' do
      gradebook = Gradebook.new("TP")
      course = Course.new("Calculus", 2)
      course2 = Course.new("Maths", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)
      course.enroll(student2)
      course2.enroll(student2)
      gradebook.add_course(course)
      gradebook.add_course(course2)
      student1.log_score(course.name, 69)
      student2.log_score(course.name, 82)
      student2.log_score(course2.name, 26)
      expect(gradebook.all_grades).to eq({course => course.grades, course2 => course2.grades})
    end
  end

  describe '#students_in_range' do
    it 'returns array of Students in that range' do
      gradebook = Gradebook.new("TP")
      course = Course.new("Calculus", 2)
      course2 = Course.new("Maths", 2)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      course.enroll(student1)
      course.enroll(student2)
      course2.enroll(student2)
      gradebook.add_course(course)
      gradebook.add_course(course2)
      student1.log_score(course.name, 69)
      student2.log_score(course.name, 82)
      student2.log_score(course2.name, 26)
      expect(gradebook.students_in_range(2, 98)).to eq [student1, student2]
    end
  end
end
