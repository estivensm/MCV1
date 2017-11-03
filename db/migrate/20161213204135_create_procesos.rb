class CreateProcesos < ActiveRecord::Migration[5.0]
  def change
    create_table :procesos do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :admin_user

      t.timestamps
    end
  end
end

