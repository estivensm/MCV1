class CreateEmployedsAndReportsAssociations < ActiveRecord::Migration[5.0]
  def up
    

    create_table :employeds_reports, id: false do |t|
      t.belongs_to :employed, index: true
      t.belongs_to :report, index: true
    end
  end

  def down
    
    drop_table :employeds_reports
  end
end


