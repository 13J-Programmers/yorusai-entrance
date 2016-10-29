class StudentsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :scan, :update, :new, :lottery, :result, :classroom]

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
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Successfully created!"
      redirect_to students_url
    else
      render 'new'
    end
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
  end

  def result
    students = Student.where(attended: true, elected: false).to_a
    if students.empty? then
      flash.now[:danger] = "抽選対象がありません。入場処理を行ってください"
    else
      @winner = students.sample
      @winner.elected = true;
      @winner.save
    end
  end

  def classroom
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected, :dept, :class_id)
    end
end
