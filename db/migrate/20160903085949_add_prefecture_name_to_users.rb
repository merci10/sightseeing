class AddPrefectureNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prefecture_name, :string
  end
end
