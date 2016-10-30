class AdminsController < ApplicationController
  before_action :logged_in_admin
  before_action :correct_admin, only: [:edit, :update, :show, :general_settings]

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Successfully saved!"
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def general_settings
    case params[:command]
    when "students:reset_attended"
      Student.update_all(attended: false)
      flash[:success] = "Attended flag has been reset."
    when "students:reset_elected"
      Student.update_all(elected: false)
      flash[:success] = "Elected flag has been reset."
    when "classrooms:reset_elected"
      Classroom.update_all(elected: false)
    end
    redirect_back(fallback_location: root_path)
  end

  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end

    # --- before filter ---

    # Confirm a correct user
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless current_admin?(@admin)
    end
end
