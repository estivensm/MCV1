class CreateNormas < ActiveRecord::Migration[5.0]
  def change
    create_table :normas do |t|
      t.string :name
      t.integer :user_id
      t.integer :admin_user
      t.string :archivo
      t.string :link

      t.timestamps
    end
  end
end
