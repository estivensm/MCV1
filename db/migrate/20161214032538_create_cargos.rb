class CreateCargos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos do |t|
      t.string :name
      t.string :description
      t.integer :proceso_id
      t.integer :user_id
      t.integer :admin_user

      t.timestamps
    end
  end
end
