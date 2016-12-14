class AddRolToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rol, :string
  end
end
