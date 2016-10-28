class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def scan
    if @student = Student.find_by(student_id: params[:student_id]) then
      @student.attended = "true"
      @student.save
    end
  end

  def update
  end

  private
    def student_params
      params.require(:student).permit(:student_id)
    end
end
