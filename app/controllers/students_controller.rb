class StudentsController < ApplicationController

  protect_from_forgery :except => [:update]

  def index
    @students = Student.all
  end

  def scan
  end

  def update
    p params
    if @student = Student.find_by(student_id: params[:student][:student_id]) then
      @student.attended = "true"
      @student.save
    end
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected)
    end
end
