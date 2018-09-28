class AddIdToRiesgo < ActiveRecord::Migration[5.1]
  def change
    add_column :riesgos, :risk_source_id, :integer
  end
end
