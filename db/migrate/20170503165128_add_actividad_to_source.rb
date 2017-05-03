class AddActividadToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :actividad, :boolean
  end
end
