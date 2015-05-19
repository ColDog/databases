class ClassListsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user TODO fix this correct user
  before_action :logged_in_activated
  before_action :logged_in_admin,     only: [:update]

  def create
    if current_user.admin
      @class_list = ClassList.create(class_params)
    else
      @class_list = current_user.class_lists.build(class_params)
    end
    if @class_list.save
      flash[:success] = 'Successfully signed up for class'
      if current_user.admin
        redirect_to course_path(@class_list.course_id)
      else
        redirect_to class_list_path(@class_list)
      end
    else
      flash[:danger] = 'Class is full or you have already signed up'
      if current_user.admin
        redirect_to course_path(@class_list.course_id)
      else
        redirect_to all_path
      end
    end
  end

  def show
    id = params[:id]
    if ClassList.find(id).present?
      @class_list = ClassList.find(id)
      @is_wait_list = false
    elsif WaitList.find(id).present?
      @class_list = WaitList.find(id)
      @is_wait_list = true
    end
  end

  def update
    @class_list = ClassList.find(params[:id])
    if @class_list.update_attributes(class_params)
      flash[:success] = 'Edited Class'
      redirect_to courses_path
    else
      flash[:danger] = 'Edit Failed'
      redirect_to courses_path
    end
  end

  def destroy
    @class_list = ClassList.find(params[:id]).destroy
    flash[:danger] = 'Application deleted'
    if current_user.admin
      redirect_to courses_path
    else
      redirect_to all_path
    end
  end

  private
  def class_params
    params.require(:class_list).permit(:course_id, :user_id, :paid)
  end

end
