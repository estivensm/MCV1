class RemoveRolFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :rol, :string
  end
end
