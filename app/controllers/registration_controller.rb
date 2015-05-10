class RegistrationController < ApplicationController
  def register
    @user = current_user
    @register = @user.class_lists.build(register_params)
  end

  private
    def register_params
      def course_params
        params.require(:class_list).permit(:course)
      end
    end

end
