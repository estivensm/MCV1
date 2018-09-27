class AddFieldsToRiesgo < ActiveRecord::Migration[5.1]
  def change
    add_column :riesgos, :context, :string
    add_column :riesgos, :treatment, :string
    add_column :riesgos, :classification_risk_id, :integer
    add_column :riesgos, :justification, :text
    add_column :riesgos, :state, :boolean
    add_column :riesgos, :risk_state, :boolean
    add_column :riesgos, :risk_value, :integer
  end
end
