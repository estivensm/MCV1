class CreateSourceParents < ActiveRecord::Migration[5.0]
  def change
    create_table :source_parents do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :admin_user
      t.string :codigo
      t.string :tipo

      t.timestamps
    end
  end
end
