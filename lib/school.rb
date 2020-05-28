class School
  attr_reader :name, :houses, :courses

  def initialize(name, houses)
    @name = name
    @houses = houses
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def sort(student)
    student.house = @houses.sample
  end

  def list_all_students_in_all_courses
    @courses.flat_map {|course| course.students}
  end

  def list_uniq_students
    list_all_students_in_all_courses.uniq
  end

  def sort_students
    list_uniq_students.each {|student| sort(student)}
  end

  def student_names
    list_uniq_students.map {|student| student.name}
  end

  def students_by_house
    list_uniq_students.group_by do |student|
      student.house
    end
  end
end
