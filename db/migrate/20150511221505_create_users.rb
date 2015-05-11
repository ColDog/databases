class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email,  unique: true
      t.integer :age
      t.text    :health_notes
      t.string  :password_digest

      t.timestamps null: false
    end
  end
end
