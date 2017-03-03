class AddEstadoToCausaEfecto < ActiveRecord::Migration[5.0]
  def change
    add_column :causa_efectos, :estado, :string
  end
end
