class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :update]
  before_action :logged_in_admin, only: [:index, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Thanks for registering, complete the process here'
      redirect_to new_class_list_path
    else
      render 'new'
    end
  end

  # admin only
  def index
    query = params[:search]
    if query.blank?
      @users = User.all
    else
      query = params[:search].downcase
      search = User.where('lower(name) like ? OR lower(email) like ?', "%#{query}%", "%#{query}%")
      if search.empty?
        @users = User.all
        flash.now[:danger] = 'No Result Found for search'
      else
        @users = search
        flash.now[:success] = "Search results for #{query}"
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @user_classes = User.find(params[:id]).class_lists
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
