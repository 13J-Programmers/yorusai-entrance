class StudentsController < ApplicationController
  before_action :logged_in_admin

  def index
    @grade = (params[:grade].blank?) ? 1 : params[:grade].to_i
    raise "grade must be between 1..5" unless @grade.between?(1, 5)

    @classrooms = Classroom.where(grade: @grade)
  end

  def scan
  end

  def new
    @student = Student.new
    @classrooms = Classroom.all
  end

  def create
    option = {
      classroom: Classroom.find_by_abbr(params[:student][:classroom_abbr])
    }
    @student = Student.new(student_params.merge(option))
    if @student.save
      flash[:success] = "Successfully created!"
      redirect_to students_url
    else
      render 'new'
    end
  end

  def update
    if @student = Student.find_by(student_id: params[:student][:student_id])
      @student.attended = "true"
      @student.attended_at = Time.zone.now
      @student.save
      # flash[:success] = "No.#{@student.student_id}を登録しました！夜祭にようこそ！"
      flash[:success] = "登録しました！#{@student.student_id}さん、夜祭にようこそ！"
      redirect_to students_scan_path
    else
      flash[:danger] = "学籍番号\"#{params[:student][:student_id]}\"が見つかりません。 お近くの役員に問い合わせてください"
      redirect_to students_scan_path
    end
  end

  def create_from_csv
    # todo:
  end

  def destroy
    if params[:student_id].present?
      student = Student.find_by(student_id: params[:student_id]).destroy
      flash[:success] = "Student #{student.student_id} have been deleted."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    Student.destroy_all
    # flash[:success] = "All students have been deleted."
    flash[:success] = "全学生の削除が完了しました"
    redirect_back(fallback_location: root_path)
  end

  def reset_elected
    Student.update_all(elected: false)
    Student.update_all(elected_at: nil)
    # flash[:success] = "Elected flag has been reset."
    flash[:success] = "抽選記録が正常にリセットされました"
    redirect_back(fallback_location: root_path)
  end

  def reset_attended
    Student.update_all(attended: false)
    Student.update_all(attended_at: nil)
    # flash[:success] = "Attended flag has been reset."
    flash[:success] = "入場記録が正常にリセットされました"
    redirect_back(fallback_location: root_path)
  end

  def attend_at_random
    n = (params[:time]) ? params[:time].to_i : 100
    n.times do
      student = Student.where(attended: false).offset(rand(Student.count)).first
      next if student.nil?
      student.attended = true
      student.attended_at = Time.zone.now
      student.save
    end
    # flash[:success] = "Some students have been attended."
    flash[:success] = "ランダム入場：完了しました"
    redirect_back(fallback_location: root_path)
  end

  private
    def student_params
      params.require(:student).permit(:student_id, :attended, :elected)
    end
end
