class AddDefaultToRol < ActiveRecord::Migration[5.1]
  def change
    add_column :rols, :default, :boolean
  end
end
