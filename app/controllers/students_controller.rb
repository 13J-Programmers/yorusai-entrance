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
      # flash[:success] = "No.#{@student.student_id}を登録しました！夜祭にようこそ！"
      flash[:success] = "登録しました！#{@student.student_id}さん、夜祭にようこそ！"
      redirect_to students_scan_path
    else
      flash[:danger] = "学籍番号\"#{params[:student][:student_id]}\"が見つかりません。 お近くの役員に問い合わせてください"
      redirect_to students_scan_path
    end
  end

  def lottery
    students = Student.where(attended: true, elected: false).to_a
    @winner = students.sample
    @winner.elected = true;
    @winner.save
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected)
    end
end
