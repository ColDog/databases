class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :code,      null: false, index: true
      t.string  :category,  null: false
      t.integer :size,      null: false
      t.string  :dates,     null: false
      t.integer :year,      null: false
      t.integer :price,     null: false
      t.string  :location,  null: false
      t.string  :title,     null: false
      t.text    :about,     null: false

      t.timestamps null: false
    end
  end
end