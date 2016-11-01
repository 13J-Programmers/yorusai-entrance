class ClassroomsController < ApplicationController
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
    classroom = Classroom.find_by(class_id: params[:class_id])
    unless classroom.nil?
      classroom.destroy
      flash[:success] = "Classroom #{classroom.class_id} have been deleted."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    Classroom.destroy_all
    flash[:success] = "All classrooms have been deleted."
    redirect_back(fallback_location: root_path)
  end

  def reset_elected
    Classroom.update_all(elected: false)
    flash[:success] = "Elected flag has been reset."
    redirect_back(fallback_location: root_path)
  end

  private
    def classroom_params
      params.require(:classroom).permit(:class_id, :elected)
    end
end