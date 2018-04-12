class AddAdminToNumeral < ActiveRecord::Migration[5.1]
  def change
    add_column :numerals, :admin, :boolean
  end
end
