class ClassListsController < ApplicationController
  before_action :logged_in_user
  before_action :logged_in_admin, only: [:destroy, :update]

  def create
    @class_list = ClassList.new(class_params)
    if @class_list.save
      flash[:success] = 'Successfully signed up for class'
      redirect_to class_list_path(@class_list)
    else
      flash[:danger] = 'Class is full or you have already signed up'
      redirect_to all_path
    end
  end

  def show
    class_list = ClassList.find(params[:id])
    if current_user.id == class_list.user_id || current_user.admin
      @class_list = class_list
    else
      redirect_to all_path
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
