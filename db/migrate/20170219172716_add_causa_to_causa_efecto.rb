class AddCausaToCausaEfecto < ActiveRecord::Migration[5.0]
  def change
    add_column :causa_efectos, :name, :string
  end
end
