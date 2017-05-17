class RemovePrefectureFromUsrs < ActiveRecord::Migration
  def change
    remove_column :users, :prefecture, :string
    remove_column :users, :prefecture_code, :string
  end
end
