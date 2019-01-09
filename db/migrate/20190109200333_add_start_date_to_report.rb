class AddStartDateToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :start_date, :date
  end
end
