class AdminsController < ApplicationController
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

  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
