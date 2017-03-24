class AddAccioncausaToCausaEfecto < ActiveRecord::Migration[5.0]
  def change
    add_column :causa_efectos, :accion_id, :integer
    add_column :causa_efectos, :estado_accion, :boolean
  end
end
