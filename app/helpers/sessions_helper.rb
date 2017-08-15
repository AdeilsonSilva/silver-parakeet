module SessionsHelper

  # Returns the information of the current logged in user or nill if no user is logged
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns the information of the current logged in soldier or nill if no soldier is logged
  def current_soldier
    @current_soldier ||= Soldier.find_by(user_id: current_user.id)
  end

  # Returns true if a user is logged in or false if none is
  def logged_in?
    current_user != nil
  end

  # Returns true if a user is logged in and is a soldier
  def is_soldier?
    current_soldier != nil
  end

  private

  def require_soldier_privileges
    unless is_soldier?
      redirect_to root_path
    end
  end

  def require_login
    unless logged_in?
      session.delete(:user_id)
      redirect_to root_path
    end
  end

  def require_logout
    if logged_in?
      redirect_to root_path
    end
  end
end
