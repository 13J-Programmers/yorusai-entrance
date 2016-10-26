class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def scan
    @student = Student.find_by(student_id: params[:student_id])
    @student.attended = "true"
    @student.save
    redirect_to '/students'
  end

  def enter
  end
end
