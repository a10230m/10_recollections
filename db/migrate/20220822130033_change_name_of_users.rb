class ChangeNameOfUsers < ActiveRecord::Migration[6.1]
  def change
    # change_column_null :対象テーブル名, :対象カラム名, false
    change_column_null :users, :name, false
  end
end
