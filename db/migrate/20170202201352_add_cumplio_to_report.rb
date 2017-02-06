class AddCumplioToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :cumplio, :boolean
  end
end
