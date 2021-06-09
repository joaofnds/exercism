class School
  attr_reader :grade_students

  def students(grade)
    @grade_students[grade]
  end

  def add(student, grade)
    @grade_students[grade] <<= student
    @grade_students[grade].sort!
  end

  def students_by_grade
    grade_students.sort_by(&:itself).map { { grade: _1, students: _2 } }
  end

  private

  def initialize
    @grade_students = Hash.new { [] }
  end
end
