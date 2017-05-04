class AddTipoToNorma < ActiveRecord::Migration[5.0]
  def change
    add_column :normas, :tipo, :boolean
  end
end
