class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :code,      null: false, index: true
      t.string  :category,  null: false
      t.integer :size,      null: false
      t.string  :dates
      t.string  :year
      t.integer :price
      t.string  :location

      t.timestamps null: false
    end
  end
end
