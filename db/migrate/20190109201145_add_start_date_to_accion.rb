class AddStartDateToAccion < ActiveRecord::Migration[5.1]
  def change
    add_column :accions, :start_date, :date
  end
end
