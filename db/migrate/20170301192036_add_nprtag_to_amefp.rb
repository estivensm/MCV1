class AddNprtagToAmefp < ActiveRecord::Migration[5.0]
  def change
    add_column :amefps, :npr_tage, :integer
  end
end
