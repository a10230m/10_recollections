class ChangeColumnIsActiveAddUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :is_active,  from: true, to: false
  end
end
