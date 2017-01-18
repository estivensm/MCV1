class CreateAccions < ActiveRecord::Migration[5.0]
  def change
    create_table :accions do |t|
      t.string :codigo
      t.string :employed_id
      t.text :descripcion
      t.string :tipo
      t.integer :costo
      t.integer :f_seguimiento
      t.date :f_compromiso
      t.date :f_real
      t.string :estado
      t.boolean :cumplio
      t.integer :contador
      t.text :evidencia
      t.integer :contador_seg
      t.integer :user_id
      t.integer :admin_user
      
      t.timestamps
    end
  end
end
