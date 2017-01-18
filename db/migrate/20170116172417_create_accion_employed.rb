class CreateAccionEmployed < ActiveRecord::Migration[5.0]
  def up
    

     create_table :accions_employeds, id: false do |t|
      t.belongs_to :employed, index: true
      t.belongs_to :accion, index: true
    end
  end

  def down
    
    drop_table :accions_employeds
  end
end


