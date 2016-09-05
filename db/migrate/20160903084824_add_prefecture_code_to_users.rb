class AddPrefectureCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prefecture_code, :string
  end
end
