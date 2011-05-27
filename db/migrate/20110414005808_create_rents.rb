class CreateRents < ActiveRecord::Migration
  def self.up
    create_table :rents do |t|
      t.integer :property_id
      t.integer :owner_id
      t.integer :tenant_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :rents
  end
end
