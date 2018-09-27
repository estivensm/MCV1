class AddLevelRiskToRiesgo < ActiveRecord::Migration[5.1]
  def change
    add_column :riesgos, :risk_level, :string
  end
end
