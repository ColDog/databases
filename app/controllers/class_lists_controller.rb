class ClassListsController < ApplicationController

  def new
    @courses = Course.all
    @class_list = ClassList.new
  end

  def create
    @class_list = ClassList.new(class_params)
    if @class_list.save
      flash[:success] = 'Successfully signed up for class'
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = 'Failed to sign up for class'
      redirect_to user_path(current_user.id)
    end
  end

  private
  def class_params
    params.require(:class_list).permit(:course_id, :user_id, :paid)
  end

end
