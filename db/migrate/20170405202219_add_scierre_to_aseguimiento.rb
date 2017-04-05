class AddScierreToAseguimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :aseguimientos, :s_cierre, :boolean
  end
end
