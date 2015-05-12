class AddColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :age_group, :string
    add_column :courses, :start_date, :date
    add_column :courses, :end_date, :date
  end
end
