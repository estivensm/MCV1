class AddTipeTracingToRseguimiento < ActiveRecord::Migration[5.1]
  def change
    add_column :rseguimientos, :type_tracing, :string
    add_column :aseguimientos, :type_tracing, :string
  end
end
