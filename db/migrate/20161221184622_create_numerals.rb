class CreateNumerals < ActiveRecord::Migration[5.0]
  def change
    create_table :numerals do |t|
      t.string :name
      t.integer :user_id
      t.integer :admin_user
      t.integer :norma_id
      t.text :description
      t.string :numeral
      t.string :norma_name

      t.timestamps
    end
  end
end
