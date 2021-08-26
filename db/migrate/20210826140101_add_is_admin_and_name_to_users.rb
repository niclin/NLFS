class AddIsAdminAndNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :name, :string, uniq: true
  end
end
