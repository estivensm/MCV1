class AddDescSubClausulaToNumeral < ActiveRecord::Migration[5.1]
  def change
    add_column :numerals, :subclausula_description, :text
  end
end
