class AddScierreToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :s_cierre, :boolean
    add_column :reports, :eficaz, :boolean
    add_column :reports, :conclucion, :text
  end
end
