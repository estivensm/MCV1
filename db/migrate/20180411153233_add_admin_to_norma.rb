class AddAdminToNorma < ActiveRecord::Migration[5.1]
  def change
    add_column :normas, :admin, :boolean
  end
end
