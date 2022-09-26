class ChangeDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :is_active, from: false, to: true
    change_column_default :users, :is_deleted, from: true, to: false
  end
end
