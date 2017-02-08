class AddCodigoToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :codigo, :string
  end
end
