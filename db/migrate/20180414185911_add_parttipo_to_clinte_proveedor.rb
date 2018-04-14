class AddParttipoToClinteProveedor < ActiveRecord::Migration[5.1]
  def change
    add_column :clinte_proveedors, :cliente_proveedor_type_id, :integer
  end
end
