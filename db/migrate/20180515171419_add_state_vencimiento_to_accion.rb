class AddStateVencimientoToAccion < ActiveRecord::Migration[5.1]
  def change
    add_column :accions, :estado_vencida, :boolean
    add_column :accions, :estado_proxima, :boolean
    add_column :accions, :estado_vigente, :boolean
  end
end
