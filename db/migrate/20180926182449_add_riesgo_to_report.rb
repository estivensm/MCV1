class AddRiesgoToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :riesgo_id, :integer
  end
end
