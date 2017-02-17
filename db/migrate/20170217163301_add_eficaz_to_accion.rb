class AddEficazToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :eficaz, :boolean
  end
end
