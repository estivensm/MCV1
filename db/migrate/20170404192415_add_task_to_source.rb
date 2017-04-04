class AddTaskToSource < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :task, :boolean
  end
end
