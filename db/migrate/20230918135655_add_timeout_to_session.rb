class AddTimeoutToSession < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :timeout, :integer, null: false, default: 0
  end
end
