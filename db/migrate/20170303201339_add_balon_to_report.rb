class AddBalonToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :balon, :string
  end
end
