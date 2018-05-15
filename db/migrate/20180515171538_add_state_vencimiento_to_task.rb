class AddStateVencimientoToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :estado_vencida, :boolean
    add_column :tasks, :estado_proxima, :boolean
    add_column :tasks, :estado_vigente, :boolean
  end
end
