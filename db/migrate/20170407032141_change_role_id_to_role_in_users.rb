class ChangeRoleIdToRoleInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :role_id, :role
  end
end
