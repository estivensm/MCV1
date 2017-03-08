class CreateAccionsCausaEfectosAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :accions_causa_efectos, id: false do |t|
    	     t.belongs_to :accion, index: true
             t.belongs_to :causa_efecto, index: true
    end
  end
end




