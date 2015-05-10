class RegistrationController < ApplicationController
  def register
    @courses = Course.all
    @user = current_user
    @register = @user.class_lists.build(register_params)
  end

  def profile
    user = current_user
    @user = user.class_lists
  end

  private
    def register_params
      def course_params
        params.require(:class_list).permit(:course)
      end
    end

end
