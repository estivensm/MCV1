class CreatePageDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :page_documents do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :admin_user
      t.string :file

      t.timestamps
    end
  end
end
