class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email,  unique: true
      t.integer :age
      t.string  :phone
      t.text    :health_notes
      t.string  :password_digest
      t.boolean :staff, default: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
