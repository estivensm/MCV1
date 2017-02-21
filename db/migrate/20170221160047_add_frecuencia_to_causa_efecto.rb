class AddFrecuenciaToCausaEfecto < ActiveRecord::Migration[5.0]
  def change
    add_column :causa_efectos, :frecuencia, :integer
    add_column :causa_efectos, :porcentaje, :float
  end
end
