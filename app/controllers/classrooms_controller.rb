class ClassroomsController < ApplicationController
  before_action :logged_in_admin

  def index
    @classrooms = Classroom.all
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      flash[:success] = "Successfully created!"
    end
    redirect_back(fallback_location: root_path)
  end

  def create_from_csv
    # todo:
  end

  def destroy
    classroom = Classroom.find_by_abbr(params[:classroom_abbr])
    if classroom.nil?
      flash[:danger] = "An error has been occured!"
    else
      classroom.destroy
      flash[:success] = "Classroom #{classroom.abbr} have been deleted."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    Classroom.destroy_all
    # flash[:success] = "All classrooms have been deleted."
    flash[:success] = "全クラスの削除が完了しました。"
    redirect_back(fallback_location: root_path)
  end

  def reset_elected
    Classroom.update_all(elected: false)
    # flash[:success] = "Elected flag has been reset."
    flash[:success] = "抽選記録は正常にリセットされました。"
    redirect_back(fallback_location: root_path)
  end

  private
    def classroom_params
      params.require(:classroom).permit(:class_id, :elected)
    end
end
