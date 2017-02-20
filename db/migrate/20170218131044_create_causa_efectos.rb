class CreateCausaEfectos < ActiveRecord::Migration[5.0]
  def change
    create_table :causa_efectos do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :nivel
      t.string :descripcion
      t.string :tipo
      t.integer :causa_id
      t.integer :report_id
    

      t.timestamps
    end
  end
end
