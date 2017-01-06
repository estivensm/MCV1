class CreateNumeralReports < ActiveRecord::Migration[5.0]
  def change
    create_table :numeral_reports do |t|
      t.text :comment
      t.integer :numeral_id
      t.integer :report_id

      t.timestamps
    end
  end
end
