class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(name: params[:session][:name].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # set settion and redirect to admin's page
      log_in admin
      redirect_to admin
    else
      # error message
      flash.now[:danger] = "invalid name/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
