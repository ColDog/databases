class CreateWaitLists < ActiveRecord::Migration
  def change
    create_table :wait_lists do |t|
      t.references  :user,    index: true
      t.references  :course,  index: true

      t.timestamps null: false
    end
    add_foreign_key :class_lists, :users
    add_foreign_key :class_lists, :courses
  end
end
