class AdminController < ApplicationController
  before_action :logged_in_admin

  def home
    @registrations = ClassList.group_by_day(:created_at).count
    @users = User.group_by_day(:created_at).count
    @class_size = Course.all
    @full = 0
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      @user.create_reset_digest
      @user.send_password_reset_email
      UserMailer.account_activation(@user).deliver_now
      flash[:success] = "Created user with id: #{@user.id} and name: #{@user.name}"
      redirect_to controller: 'admin', action: 'new_class', user_id: @user.id
    else
      flash[:danger] = "Failed: #{@user.errors.full_messages.each { |m| "#{m}," } }"
      redirect_to users_path
    end
  end

  def new_class
    @user = User.find(params[:user_id])
    @courses  = Course.search(params[:class_search])
    filter_params(params).each do |search, result|
      @courses = @courses.public_send(search, result) if result.present?
    end
    @course   = Course.find(params[:course_id]) unless params[:course_id].nil?
  end

  def create_class_list
    @class_list = ClassList.new(class_params)
    if @class_list.save # (validate: false) todo should be validate false?
      flash[:success] = 'User added to class'
      redirect_to course_path(@class_list.course_id)
    else
      flash[:danger] = 'failed to add user to class'
      redirect_to users_path
    end
  end

  def create_wait_list
    @wait_list = WaitList.new(wait_params)
    if @wait_list.save # (validate: false) todo should be validate false?
      flash[:success] = 'User added to wait list'
      redirect_to course_path(@wait_list.course_id)
    else
      flash[:danger] = 'failed to add user to wait list'
      redirect_to users_path
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
