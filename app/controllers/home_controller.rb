class HomeController < ApplicationController
  def home
  end


  # LESSONS
  def lessons
    @courses = Course.all
    @class_list = ClassList.new
  end

  def beginner
    @course = Course.where('category = ?', 'beginner')
    @class_list = ClassList.new
  end

  def intermediate
    @courses = Course.where('category = ?', 'intermediate')
    @class_list = ClassList.new
  end

  def advanced
    @courses = Course.where('category = ?', 'advanced')
    @class_list = ClassList.new
  end


  # GROUPS
  def groups
  end


  # RENTALS
  def rentals
  end


  # OTHER
  def about
  end

  def weather
  end
end
