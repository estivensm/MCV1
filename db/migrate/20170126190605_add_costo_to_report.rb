class AddCostoToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :costo, :integer
  end
end
