class AddCargoToEmployed < ActiveRecord::Migration[5.0]
  def change
    add_column :employeds, :cargo_id, :integer
   
  end
end
