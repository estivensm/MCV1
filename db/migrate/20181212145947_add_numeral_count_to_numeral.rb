class AddNumeralCountToNumeral < ActiveRecord::Migration[5.1]
  def change
    add_column :numerals, :numeral_count, :integer
  end
end
