class CreateRiesgos < ActiveRecord::Migration[5.0]
  def change
    create_table :riesgos do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :report_id
      t.integer :accion_id
      t.text :descripcion
      t.string :clasificacion
      t.string :nivel

      t.timestamps
    end
  end
end
