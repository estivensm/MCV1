class AddProcesoToRiesgo < ActiveRecord::Migration[5.1]
  def change
    add_column :riesgos, :proceso_id, :integer
  end
end
