class CreateNumeralsReports < ActiveRecord::Migration[5.0]
  def up
    

     create_table :numerals_reports, id: false do |t|
      t.belongs_to :report, index: true
      t.belongs_to :numeral, index: true
    end
  end

  def down
    
    :numerals_reports
  end
end
