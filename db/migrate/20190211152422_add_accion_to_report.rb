class AddAccionToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :accion_id, :integer
  end
end
