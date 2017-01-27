class AddAccionToSeguimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :aseguimientos, :accion_id, :integer
  end
end
