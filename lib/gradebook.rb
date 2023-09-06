class Gradebook
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    course_hash = Hash.new
    @courses.each do |course|
      course_hash[course] = course.students
    end
    return course_hash
  end

  def students_below(threshold)
    @courses.map { |c| c.students }.flatten
            .filter { |s| s.grade < threshold }
  end
end
