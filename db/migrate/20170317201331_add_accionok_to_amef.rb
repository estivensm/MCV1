class AddAccionokToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :accion_ok, :boolean
  end
end
