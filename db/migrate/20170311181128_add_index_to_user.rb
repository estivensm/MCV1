class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
  	   add_index :users, :email
  	  add_index  :users, :name, unique: true
  end
end
