class AddAmefpToAmef < ActiveRecord::Migration[5.0]
  def change
    add_column :amefs, :amefp_id, :integer
  end
end
