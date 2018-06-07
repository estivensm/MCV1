class AddFieldsToNumerals < ActiveRecord::Migration[5.1]
  def change
    add_column :numerals, :clausula, :string
    add_column :numerals, :subtitulo, :string
    add_column :numerals, :subclausula, :string
  end
end
