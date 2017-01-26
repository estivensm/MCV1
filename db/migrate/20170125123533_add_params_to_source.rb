class AddParamsToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :accion, :boolean
    add_column :sources, :correccion, :boolean
    add_column :sources, :causa, :boolean
    add_column :sources, :puede_ac, :boolean
  end
end
