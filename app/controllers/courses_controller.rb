class CoursesController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :new_user_session_path unless current_user && current_user.admin?
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      flash[:success] = 'Course Created'
      redirect_to courses_path
    else
      flash[:danger] = 'Course Create Failed'
      render 'courses/new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = 'Course Updated'
      redirect_to courses_path
    else
      flash[:danger] = 'Course Update Failed'
      render 'courses/edit'
    end
  end

  def destroy
    @course = Course.find(params[:id]).destroy
    flash[:danger] = 'Course Deleted'
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(
                             :code,
                             :category,
                             :size,
                             :dates,
                             :year,
                             :price,
                             :location,
                             :title,
                             :about
    )
  end

end