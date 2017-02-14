class AddTagToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :tag, :boolean
  end
end
