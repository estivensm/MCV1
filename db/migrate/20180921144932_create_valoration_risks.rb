class CreateValorationRisks < ActiveRecord::Migration[5.1]
  def change
    create_table :valoration_risks do |t|
      t.boolean :controls
      t.integer :np_value
      t.integer :ne_value
      t.integer :nd_value
      t.string :np_text
      t.string :ne_text
      t.string :nd_text
      t.integer :nc_value
      t.string :nc_text
      t.text :probability_indicator
      t.text :impact_indicator
      t.integer :nr_value
      t.string :risk_level
      t.integer :user_id
      t.integer :admin_user
      t.integer :riesgo_id
      t.date :next_valoration
      t.date :valoration_date
      t.text :analysis

      t.timestamps
    end
  end
end
