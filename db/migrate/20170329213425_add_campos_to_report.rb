class AddCamposToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :evidencia, :boolean
    add_column :sources, :requisito, :boolean
    add_column :sources, :numerales, :boolean
  end
end
