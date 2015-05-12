class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :code,      index: true
      t.string  :category
      t.string  :boat
      t.integer :size
      t.string  :dates
      t.integer :year
      t.integer :price
      t.string  :location
      t.string  :title
      t.text    :about

      t.timestamps null: false
    end
  end
end