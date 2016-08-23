class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :image
      t.text :content

      t.timestamps
    end
  end
end
