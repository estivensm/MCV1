class AddUserToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
    add_column :contacts, :admin_user, :integer
  end
end
