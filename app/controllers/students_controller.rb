class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def scan
    if @student = Student.find_by(student_id: params[:student_id]) then
      @student.attended = "true"
      @student.save
    end
    redirect_to '/students'
  end

  def enter
  end
end
