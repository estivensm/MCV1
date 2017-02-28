class AddAtomarToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :a_tomar, :string
  end
end
