class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :waiver, :boolean, default: false
  end
end
