class AddEmployedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :employed_id, :integer
  end
end
