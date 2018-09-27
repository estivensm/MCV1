class CreateClassificationRisks < ActiveRecord::Migration[5.1]
  def change
    create_table :classification_risks do |t|
      t.integer :user_id
      t.integer :admin_user
      t.string :name
      t.text :description
      t.string :context

      t.timestamps
    end
  end
end
