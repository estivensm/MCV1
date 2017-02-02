class CreateRseguimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :rseguimientos do |t|
      t.integer :user_id
      t.integer :admin_user
      t.date :f_seguimiento
      t.text :descripcion
      t.integer :report_id
      t.string :evidencia

      t.timestamps
    end
  end
end
