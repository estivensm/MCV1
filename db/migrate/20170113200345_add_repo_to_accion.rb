class AddRepoToAccion < ActiveRecord::Migration[5.0]
  def change
    add_column :accions, :report_id, :integer
  end
end
