class CreateClienteProveedorTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :cliente_proveedor_types do |t|
      t.integer :admin_user
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
