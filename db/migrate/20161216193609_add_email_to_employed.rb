class AddEmailToEmployed < ActiveRecord::Migration[5.0]
  def change
    add_column :employeds, :email, :string
  end
end
