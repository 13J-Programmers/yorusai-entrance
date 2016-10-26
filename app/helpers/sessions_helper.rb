module SessionsHelper
  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    end
    @current_admin
  end

  # return true if the given admin is the current admin
  def current_admin?(admin)
    admin == current_admin
  end

  def logged_in?
    !current_admin.nil?
  end

  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
end
