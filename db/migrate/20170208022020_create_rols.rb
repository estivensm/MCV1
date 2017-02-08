class CreateRols < ActiveRecord::Migration[5.0]
  def change
    create_table :rols do |t|
      t.integer :admin_user
      t.integer :user_id
      t.boolean :configuracion
      t.boolean :report_ver
      t.boolean :report_crear
      t.boolean :report_edit
      t.boolean :report_delete
      t.string :name

      t.timestamps
    end
  end
end
