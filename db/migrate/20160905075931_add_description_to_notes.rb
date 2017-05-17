class AddDescriptionToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :description, :string
    add_column :notes, :address, :string
    add_column :notes, :latitude, :float
    add_column :notes, :longitude, :float
  end
end
