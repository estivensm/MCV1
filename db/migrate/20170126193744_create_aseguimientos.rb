class CreateAseguimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :aseguimientos do |t|
      t.integer :user_id
      t.integer :admin_user
      t.date :f_seguimiento
      t.text :descripcion
      t.boolean :cierra
      t.boolean :eficaz
      t.text :conclucion
      t.integer :costo
      t.string :evidencia

      t.timestamps
    end
  end
end
