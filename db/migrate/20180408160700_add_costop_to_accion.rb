class AddCostopToAccion < ActiveRecord::Migration[5.1]
  def change
    add_column :accions, :costo_presupuestado, :integer
  end
end
