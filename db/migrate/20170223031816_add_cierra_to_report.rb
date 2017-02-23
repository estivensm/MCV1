class AddCierraToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :cierra_id, :integer
  end
end
