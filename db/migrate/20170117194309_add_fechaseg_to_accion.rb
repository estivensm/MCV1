class AddFechasegToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :fp_seguimiento, :date
  end
end
