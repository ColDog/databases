class RegistrationController < ApplicationController
  # before_filter :authenticate_user!

  def register
    @course = Course.find_by_code(params[:code])
  end

  def profile
    @user = current_user.class_lists
  end

end
