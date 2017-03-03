class AddEstadooToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :sestado, :string
    add_column :amefs, :testado, :string
  end
end
