class AddCreateAllToRol < ActiveRecord::Migration[5.1]
  def change
    add_column :rols, :create_all, :boolean
  end
end
