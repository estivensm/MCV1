class AddCausaEfectoToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :causa_efecto_id, :integer
  end
end
