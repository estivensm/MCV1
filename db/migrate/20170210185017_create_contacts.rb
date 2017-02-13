class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mobil
      t.string :email
      t.string :cargo
      t.integer :clinte_proveedor_id

      t.timestamps
    end
  end
end
