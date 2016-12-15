class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.string :phone
      t.string :address
      t.string :nit
      t.string :user_id
      

      t.timestamps
    end
  end
end
