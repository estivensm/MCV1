class AddEstadoToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :estado, :string
  end
end
