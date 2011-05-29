class AddLatLgnToProperties < ActiveRecord::Migration
  def self.up
  	add_column :properties, :lat, :float
    add_column :properties, :lng, :float
  end

  def self.down
  	remove_column :properties, :lat
    remove_column :properties, :lng
  end
end
