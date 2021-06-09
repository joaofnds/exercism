class School
  attr_reader :grade_students

  def students(grade)
    @grade_students.fetch(grade, [])
  end

  def add(student, grade)
    students = @grade_students.fetch(grade, [])
    students << student
    @grade_students[grade] = students.sort!
  end

  def students_by_grade
    grade_students
      .each_pair.sort_by { _1 }
      .map { { grade: _1, students: _2 } }
  end

  private

  def initialize
    @grade_students = {}
  end
end
