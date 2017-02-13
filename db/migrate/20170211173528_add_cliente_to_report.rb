class AddClienteToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :clinte_proveedor_id, :integer
    add_column :reports, :contact_id, :integer
  end
end
