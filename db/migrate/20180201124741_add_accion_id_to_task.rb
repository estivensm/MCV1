class AddAccionIdToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :accion_id, :integer
  end
end
