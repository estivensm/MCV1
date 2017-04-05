class AddScierreToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :s_cierre, :boolean
  end
end
