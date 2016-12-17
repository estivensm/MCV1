class AddAvatareToEmployed < ActiveRecord::Migration[5.0]
  def change
    add_column :employeds, :avatare, :string
  end
end
