class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :second_name
      t.integer :dni
      t.string :address
      t.integer :phone
      t.string :email
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
