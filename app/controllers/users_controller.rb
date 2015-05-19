class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :show, :edit, :update]
  before_action :logged_in_admin, only: [:index, :destroy]
  before_action :correct_user,    only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    filter_params(params).each do |search, result|
      @users = @users.public_send(search, result) if result.present?
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Account updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = 'User Deleted'
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :age,
                                   :phone,
                                   :health_notes,
                                   :password,
                                   :password_confirmation,
                                   :waiver
      )
    end

    def filter_params(params)
      params.slice(:search, :phone)
    end

end
