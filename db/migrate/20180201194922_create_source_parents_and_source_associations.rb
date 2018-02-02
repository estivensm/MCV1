class CreateSourceParentsAndSourceAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :source_parents_sources, id: false do |t|
    	 t.belongs_to :source_parent, index: true
        t.belongs_to :source, index: true   
    end
  end
end


