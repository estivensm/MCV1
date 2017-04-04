class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :employed_id
      t.integer :report_id
      t.string :name
      t.text :observacion
      t.integer :costo
      t.date :f_compromiso
      t.date :f_real
      t.boolean :estado
      t.boolean :cumplio
      t.integer :contador
      t.integer :contador_seg
      t.string :anexo
      t.string :codigo

      t.timestamps
    end
  end
end
