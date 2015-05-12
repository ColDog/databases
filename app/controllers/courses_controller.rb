class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :logged_in_admin


  def index
    @courses = Course.filter(params.slice(:search, :location, :category, :boat, :age_group))
  end

  def show
    @course = Course.find(params[:id])
    @class_list = Course.find(params[:id]).class_lists
    @count = 1
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
                             :boat,
                             :category,
                             :size,
                             :dates,
                             :year,
                             :price,
                             :location,
                             :title,
                             :about,
                             :age_group,
                             :start_date,
                             :end_date
    )
  end

  def filter_params(params)
    params.slice(:search, :location, :category, :boat, :age_group)
  end

end