class AddFechasToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :f_seguimiento, :integer
    add_column :reports, :f_compromiso, :date
    add_column :reports, :f_real, :date
    add_column :reports, :fp_seguimiento, :date
    add_column :reports, :contador_seg, :integer
  end
end
