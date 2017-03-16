class AddScierreToRseguimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :rseguimientos, :s_cierre, :boolean
    add_column :rseguimientos, :cerrar, :boolean
    add_column :rseguimientos, :eficaz, :boolean
    add_column :rseguimientos, :conclucion, :text
  end
end
