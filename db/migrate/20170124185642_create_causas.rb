class CreateCausas < ActiveRecord::Migration[5.0]
  def change
    create_table :causas do |t|
      t.string :tipo
      t.text :descripcion
      t.string :archivo
      t.integer :admin_user
      t.integer :user_id
      t.integer :report_id

      t.timestamps
    end
  end
end
