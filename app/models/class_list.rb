class ClassList < ActiveRecord::Base
  # before_save { self. } ClassList.find(User.first.class_lists[0].id).use

  belongs_to :course
  belongs_to :user
end
