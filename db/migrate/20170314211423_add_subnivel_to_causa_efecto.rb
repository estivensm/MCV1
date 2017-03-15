class AddSubnivelToCausaEfecto < ActiveRecord::Migration[5.0]
  def change
    add_column :causa_efectos, :subnivel, :string
  end
end
