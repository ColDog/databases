class MainController < ApplicationController
  def home
  end

  def adult
    @courses = Course.where('age_group = ?', 'Adult').group_by(&:category)
    @class_list = ClassList.new
  end

  def youth
    @courses = Course.where('age_group != ?', 'Adult').group_by(&:age_group)
  end

  def groups
  end

  def rentals
  end
end
