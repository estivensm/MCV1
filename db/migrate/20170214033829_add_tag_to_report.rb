class AddTagToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :tag, :boolean
  end
end
