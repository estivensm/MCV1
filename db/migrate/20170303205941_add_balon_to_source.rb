class AddBalonToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :balon, :boolean
  end
end
