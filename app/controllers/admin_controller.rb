class AdminController < ApplicationController
  before_action :logged_in_admin

  def new_user
    @password = User.new_token
  end

  def create_user
    @user = User.new(user_params)
    if @user.save(validate: false)
      # @user.create_reset_digest
      # @user.send_password_reset_email
      flash[:success] = 'Created user.'
      redirect_to controller: 'admin', action: 'new_class', user_id: @user.id
    else
      flash[:danger] = 'Failed to create user'
      redirect_to user_path
    end
  end

  def new_class
    @courses = Course.where(nil)
    filter_params(params).each do |search, result|
      @courses = @courses.public_send(search, result) if result.present?
    end
  end

  def create_class_list
    @class_list = ClassList.new(class_params)
    if @class_list.save(validate: false)
      flash[:success] = 'User added to class'
      redirect_to users_path
    else
      flash[:danger] = 'failed to add user to class'
      render 'new_class'
    end
  end

  def create_wait_list
    @wait_list = WaitList.new(wait_params)
    if @wait_list.save(validate: false)
      flash[:success] = 'User added to wait list'
      redirect_to users_path
    else
      flash[:danger] = 'failed to add user to wait list'
      render 'new_class'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :age, :phone, :health_notes, :password,
                                   :password_confirmation, :waiver )
    end

    def class_params
      params.require(:class_list).permit(:course_id, :user_id, :paid )
    end

    def wait_params
      params.require(:wait_list).permit(:course_id, :user_id )
    end

    def filter_params(params)
      params.slice(:search, :location, :category, :boat, :age_group, :not_age, :start_date, :end_date)
    end

end
