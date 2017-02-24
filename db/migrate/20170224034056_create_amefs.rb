class CreateAmefs < ActiveRecord::Migration[5.0]
  def change
    create_table :amefs do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :report_id
      t.integer :causa_id
      t.string  :efecto_fallo
      t.integer :grado
      t.string  :tipo
      t.string  :modo_fallo
      t.string  :causa_fallo
      t.integer :p_ocurrencia
      t.string  :c_actuales
      t.integer :pn_deteccion
      t.integer :npr
      t.integer :employed_id
      t.integer :sgrado
      t.integer :tgrado
      t.integer :sp_ocurrencia
      t.integer :tp_ocurrencia
      t.integer :spn_deteccion
      t.integer :tpn_deteccion
      t.integer :snpr
      t.integer :tnpr

      t.timestamps
    end
  end
end
