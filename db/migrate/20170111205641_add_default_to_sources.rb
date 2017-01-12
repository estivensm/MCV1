class AddDefaultToSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :default, :boolean
    add_column :reports, :archivo, :string
  end
end
