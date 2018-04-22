class AddApiKeyToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :api_key, :string
  end
end
