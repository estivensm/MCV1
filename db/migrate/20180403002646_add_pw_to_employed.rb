class AddPwToEmployed < ActiveRecord::Migration[5.1]
  def change
    add_column :employeds, :password, :string
    add_column :employeds, :password_c, :string
    add_column :employeds, :is_user, :boolean
    add_column :employeds, :user_name, :string
  end
end
