class CreateAmefps < ActiveRecord::Migration[5.0]
  def change
    create_table :amefps do |t|
      t.integer :user_id
      t.integer :admin_user
      t.integer :report_id
      t.integer :causa_id
      t.text :descripcion
      t.integer :employed_id
      t.boolean :p_valoracion
      t.date :frp_valoracion
      t.text :dp_valoracion
      t.integer :p_valor
      t.boolean :s_valoracion
      t.date :frs_valoracion
      t.text :ds_valoracion
      t.integer :s_valor
      t.boolean :t_valoracion
      t.date :frt_valoracion
      t.text :dt_valoracion
      t.integer :t_valor

      t.timestamps
    end
  end
end
