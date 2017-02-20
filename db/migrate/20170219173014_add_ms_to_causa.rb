class AddMsToCausa < ActiveRecord::Migration[5.0]
  def change
    add_column :causas, :primera_m, :string
    add_column :causas, :seguna_m, :string
    add_column :causas, :tercera_m, :string
    add_column :causas, :cuarta_m, :string
    add_column :causas, :quinta_m, :string
    add_column :causas, :sexta_m, :string
  end
end
