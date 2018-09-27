class AddControlDescToValorationRisk < ActiveRecord::Migration[5.1]
  def change
    add_column :valoration_risks, :controls_description, :text
  end
end
