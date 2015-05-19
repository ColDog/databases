class WaitListsController < ApplicationController
  before_action :logged_in_user
  before_action :logged_in_activated
  before_action :logged_in_admin, only: [:update]

  def create
    if current_user.admin
      @wait_list = WaitList.create(wait_params)
    else
      @wait_list = current_user.wait_lists.build(wait_params)
    end
    if @wait_list.save
      flash[:success] = 'Successfully signed up for wait list'
      if current_user.admin
        redirect_to course_path(@wait_list.course_id)
      else
        redirect_to class_list_path(@wait_list)
      end
    else
      flash[:danger] = 'Class is open or you have already signed up'
      if current_user.admin
        redirect_to course_path(@wait_list.course_id)
      else
        redirect_to all_path
      end
    end
  end

  def update
    @wait_list = WaitList.find(params[:id])
    if @wait_list.update_attributes(wait_params)
      flash[:success] = 'Edited Class'
      redirect_to courses_path
    else
      flash[:danger] = 'Edit Failed'
      redirect_to courses_path
    end
  end

  def destroy
    @wait_list = WaitList.find(params[:id]).destroy
    flash[:danger] = 'Application deleted'
    if current_user.admin
      redirect_to courses_path
    else
      redirect_to all_path
    end
  end

  private
  def wait_params
    params.require(:wait_list).permit(:course_id, :user_id)
  end


end
