class AddReportToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :employed_reporta, :integer
  end
end
