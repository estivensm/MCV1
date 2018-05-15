class AddStateVencimientoToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :estado_vencida, :boolean
    add_column :reports, :estado_proxima, :boolean
    add_column :reports, :estado_vigente, :boolean
  end
end
