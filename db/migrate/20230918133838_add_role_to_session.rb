class AddRoleToSession < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :role, :string, default: "user"
  end
end
