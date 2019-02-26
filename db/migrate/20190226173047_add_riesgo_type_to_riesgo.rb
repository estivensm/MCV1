class AddRiesgoTypeToRiesgo < ActiveRecord::Migration[5.1]
  def change
    add_column :riesgos, :risk_type, :string, default: "Proceso"
  end
end
