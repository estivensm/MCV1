class AddRolIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rol_id, :integer
  end
end
