class AddCountToValorationRisk < ActiveRecord::Migration[5.1]
  def change
    add_column :valoration_risks, :count, :integer
  end
end
