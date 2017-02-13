class AddTipocpToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :tipo, :string
  end
end
