class StudentsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :scan, :update, :new, :lottery]

  def index
    @grade = (params[:grade].blank?) ? 1 : params[:grade].to_i
    raise "grade must be between 1..5" unless @grade.between?(1, 5)

    # get records of specified grade
    @students = Student.where(
      "student_id LIKE '?%'",
      Student.grade_to_digit(@grade)
    ).to_a
  end

  def scan
  end

  def new
  end

  def update
    if @student = Student.find_by(student_id: params[:student][:student_id]) then
      @student.attended = "true"
      @student.save
      flash[:success] = "登録しました！夜祭にようこそ"
      redirect_to students_scan_path
    else
      flash[:danger] = "学籍番号が見つかりません お近くの役員に問い合わせてください"
      redirect_to students_scan_path
    end
  end

  def lottery
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected)
    end
end
