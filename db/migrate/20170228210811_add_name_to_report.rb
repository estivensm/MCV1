class AddNameToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :name, :string
  end
end
