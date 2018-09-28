class CreateRiskSources < ActiveRecord::Migration[5.1]
  def change
    create_table :risk_sources do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :name
      t.text :description
      t.string :code

      t.timestamps
    end
  end
end
