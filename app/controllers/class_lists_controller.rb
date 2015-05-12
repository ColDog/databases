class ClassListsController < ApplicationController
  before_action :logged_in_user
  before_action :logged_in_admin, only: [:destroy, :edit]

  def new
    @courses = Course.all.group_by(&:category)
    @class_list = ClassList.new
  end

  def create
    @class_list = ClassList.new(class_params)
    if @class_list.save
      flash[:success] = 'Successfully signed up for class'
      redirect_to user_path(current_user.id)
    else
      flash[:danger] = 'Class is full or you have already signed up'
      redirect_to new_class_list_path
    end
  end

  def update
    @class_list = ClassList.find(params[:id])
    if @class_list.update_attributes(course_params)
      flash[:success] = 'Edited Class'
      redirect_to courses_path
    else
      flash[:danger] = 'Edit Failed'
      redirect_to courses_path
    end
  end

  def destroy
    @class_list = ClassList.find(params[:id]).destroy
    flash[:danger] = 'Course Deleted'
    redirect_to courses_path
  end

  private
  def class_params
    params.require(:class_list).permit(:course_id, :user_id, :paid)
  end

end
