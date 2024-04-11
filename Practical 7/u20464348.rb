class Student
  attr_accessor :student_number
  attr_reader :marks, :tests_written

  def initialize(student_number)
    @student_number = student_number
    @marks = []
    @tests_written = 0
  end

  def addTestScore(score)
    @marks << score
    @tests_written += 1
  end

  def getCurrentAverageMark
    raise "This method should be overridden in subclasses."
  end
end


class FullTimeStudent < Student
  def getCurrentAverageMark
    min_mark = @marks.min
    sum_marks = @marks.sum - min_mark
    (@tests_written - 1) == 0 ? 0 : sum_marks / (@tests_written - 1)
  end
end

class PartTimeStudent < Student
  def getCurrentAverageMark
    max_mark = @marks.max
    sum_marks = @marks.sum - max_mark
    (@tests_written - 1) == 0 ? 0 : sum_marks / (@tests_written - 1)
  end
end



class Course
  def initialize
    @students = []
  end

  def addStudent(student_number, type)
    student = type == 'f' ? FullTimeStudent.new(student_number) : PartTimeStudent.new(student_number)
    @students << student
  end

  def contains(student_number)
    @students.any? { |student| student.student_number == student_number }
  end

  def addMark(student_number, mark)
    student = @students.find { |s| s.student_number == student_number }
    student.addTestScore(mark) if student
  end

  def getCurrentAverageMark(student_number)
    student = @students.find { |s| s.student_number == student_number }
    if student
      student.getCurrentAverageMark
    else
      "Student not found."
    end
  end
end

def main
  course = Course.new

  puts "Enter student details (student number, type 'f' for full time, 'p' for part time, and three test scores):"

  loop do
    print "Student number: "
    student_number = gets.chomp.to_i

    break if student_number == -1

    print "Student type (f/p): "
    student_type = gets.chomp

    if student_type == 'f' || student_type == 'p'
      course.addStudent(student_number, student_type)
      3.times do |i|
        print "Test score ##{i + 1}: "
        mark = gets.chomp.to_f
        course.addMark(student_number, mark)
      end
    else
      puts "Invalid student type. Please enter 'f' for full time or 'p' for part time."
    end
  end

  loop do
    puts "Enter student number to perform actions (1: Get average marks, 2: Add mark, 3: Remove mark, 4: Check if student exists, 5: Add student, -1: Exit):"
    action = gets.chomp.to_i

    break if action == -1

    print "Enter student number: "
    student_number = gets.chomp.to_i

    case action
    when 1
      if course.contains(student_number)
        average_mark = course.getCurrentAverageMark(student_number)
        puts "Average Mark: #{average_mark}"
      else
        puts "Student not found."
      end
    when 2
      print "Enter mark to add: "
      mark = gets.chomp.to_f
      course.addMark(student_number, mark)
      puts "Mark added."
    when 3
      print "Enter mark to remove: "
      mark = gets.chomp.to_f
      course.removeMark(student_number, mark)
      puts "Mark removed."
    when 4
      if course.contains(student_number)
        puts "Student exists in the course."
      else
        puts "Student not found in the course."
      end
    when 5
      print "Student number: "
      student_number = gets.chomp.to_i
      print "Student type (f/p): "
      student_type = gets.chomp
      if student_type == 'f' || student_type == 'p'
      course.addStudent(student_number, student_type)
      3.times do |i|
        print "Test score #{i + 1}: "
        mark = gets.chomp.to_f
        course.addMark(student_number, mark)
      end
      else
        puts "Invalid student type. Please enter 'f' for full time or 'p' for part time."
      end
    end
  end
end

main

