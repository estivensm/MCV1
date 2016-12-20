class CreateEmployeds < ActiveRecord::Migration[5.0]
  def change
    create_table :employeds do |t|
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.string :document_type
      t.string :document
      t.date :birth_date
      t.string :genero
      t.integer :admin_user
      t.integer :user_id
      t.string :avatare

      t.timestamps
    end
  end
end
