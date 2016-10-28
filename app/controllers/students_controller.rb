class StudentsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :scan, :update]

  def index
    @students = Student.all
  end

  def scan
    # TODO
    # validate student
    @student = Student.find_by(student_id: params[:student_id])
    @student.attended = "true"
    @student.save
    redirect_to '/students'
  end

  def enter
  end
end
