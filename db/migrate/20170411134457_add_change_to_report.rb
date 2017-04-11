class AddChangeToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :change_cumplio, :boolean
    add_column :reports, :justificacion_cumplio, :text

    add_column :accions, :change_cumplio, :boolean
    add_column :accions, :justificacion_cumplio, :text

    add_column :tasks, :change_cumplio, :boolean
    add_column :tasks, :justificacion_cumplio, :text
  end
end
