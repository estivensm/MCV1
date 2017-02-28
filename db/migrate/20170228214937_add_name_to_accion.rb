class AddNameToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :name, :string
  end
end
