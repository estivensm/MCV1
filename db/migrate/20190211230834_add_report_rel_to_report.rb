class AddReportRelToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :report_id, :integer
  end
end
