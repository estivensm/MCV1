class CreateClinteProveedors < ActiveRecord::Migration[5.0]
  def change
    create_table :clinte_proveedors do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :name
      t.string :pbx
      t.string :address
      t.string :nit
      t.string :correo_empresa
      t.string :contact_name
      t.string :contact_telephone
      t.string :contact_email
      t.string :tipo
      t.string :web

      t.timestamps
    end
  end
end
