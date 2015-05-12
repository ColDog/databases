class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Thanks for signing up!'
      redirect_to new_class_list_path
    else
      render 'new'
    end
  end

  # admin only

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_classes = User.find(params[:id]).class_lists
    @class_signup = User.find(params[:id]).class_lists.create!
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :age,
                                   :phone,
                                   :health_notes,
                                   :password,
                                   :password_confirmation
      )
    end

end
