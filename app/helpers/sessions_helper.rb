module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # creates the user session in cookies
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns current user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # checks if current user is the user argument
  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # forget a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # helper for logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Log In'
      redirect_to login_url
    end
  end

  # helper for logged in admin user
  def logged_in_admin
    unless current_user.admin?
      flash[:danger] = 'Please Log In'
      redirect_to login_url
    end
  end

  # helper for logged in activated user
  def logged_in_activated
    unless current_user.activated?
      flash[:danger] = 'Please Activate Your Account'
      redirect_to user_path(current_user)
    end
  end

  # checks if user is correct
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin
  end

end
