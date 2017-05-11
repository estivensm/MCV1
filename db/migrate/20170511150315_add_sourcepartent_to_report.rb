class AddSourcepartentToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :source_parent_id, :integer
  end
end
