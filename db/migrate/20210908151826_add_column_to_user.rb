class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sex, :boolean, default: true
    add_column :users, :is_admin, :boolean, index: true, default: false
  end
end
