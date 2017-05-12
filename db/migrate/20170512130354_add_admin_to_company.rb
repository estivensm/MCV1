class AddAdminToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :admin_user, :integer
  end
end
