class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string  :kind
      t.integer :owner_id
      t.string  :operation
      t.string  :address
      t.integer :rooms
      t.integer :bathrooms
      t.text    :description
      t.integer :price
      t.string  :state

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
