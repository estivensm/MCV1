class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :admin_user
      t.boolean :state
      t.boolean :default

      t.timestamps
    end
  end
end
