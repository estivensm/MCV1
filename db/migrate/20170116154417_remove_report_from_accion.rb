class RemoveReportFromAccion < ActiveRecord::Migration[5.0]
  def change
    remove_column :accions, :employed_reporta, :integer
  end
end
