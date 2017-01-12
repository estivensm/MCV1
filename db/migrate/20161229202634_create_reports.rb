class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      
      t.integer :employed_id
      t.integer :proceso_id
      t.text :description
      t.text :requisito
      t.text :evidencia
      t.string :nc_type
      t.string :accion
      t.text :justificacion
      t.integer :user_id
      t.integer :admin_user
      t.string :state
      t.string :codigo
      t.integer :contador
      t.integer :source_id
      t.string :archivo
      t.timestamps
    end
  end
end
