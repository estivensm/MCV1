class RemoveIndexToUser < ActiveRecord::Migration[5.0]
  def change
  	  remove_index :users, :email
  	 # remove_index  :users, :name
    
  end
end


