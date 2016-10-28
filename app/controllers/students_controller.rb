class StudentsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :scan, :update]

  def index
    @students = Student.all
  end

  def scan
  end

  def update
    if @student = Student.find_by(student_id: params[:student][:student_id]) then
      @student.attended = "true"
      @student.save
      flash[:success] = "Successfully updated"
      redirect_to students_scan_path
    else
      flash[:danger] = "Failed to update"
      redirect_to students_scan_path
    end
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected)
    end
end
