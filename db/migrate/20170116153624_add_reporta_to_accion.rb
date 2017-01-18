class AddReportaToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :employed_reporta, :integer
  end
end
