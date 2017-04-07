class RemoveForeignKeyRolesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key "users", "roles"
  end
end
