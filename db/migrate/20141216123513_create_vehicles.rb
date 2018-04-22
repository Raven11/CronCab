class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :registration_no
      t.integer :driver_id
      t.belongs_to :driver, index: true

      t.timestamps
    end
  end
end
