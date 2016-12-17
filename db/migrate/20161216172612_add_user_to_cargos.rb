class AddUserToCargos < ActiveRecord::Migration[5.0]
  def change
    add_column :cargos, :user_id, :integer
    add_column :cargos, :admin_user, :integer
  end
end
