class CreateCargosUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos_users , id: false do |t|
    	t.belongs_to :cargo, index: true
    	t.belongs_to :user, index: true
    end
  end
end
