class AdminsController < ApplicationController
  before_action :logged_in_admin
  before_action :correct_admin, only: [:edit, :update, :show]

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
      # flash[:success] = "Successfully saved!"
      flash[:success] = "正常に保存されました！"
      redirect_to @admin
    else
      render 'edit'
    end
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
