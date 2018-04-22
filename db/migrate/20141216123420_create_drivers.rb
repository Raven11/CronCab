class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string  :name
      t.integer :mobile
      t.string  :license_no
      t.string  :pan_no
      t.integer :image_id
      t.boolean :status
	  t.belongs_to :image, index: true

      t.timestamps
    end
  end
end
