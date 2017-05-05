class AddSendMailToAseguimiento < ActiveRecord::Migration[5.0]
  def change
    add_column :aseguimientos, :send_mail, :boolean
    add_column :rseguimientos, :send_mail, :boolean
    add_column :tasks, :send_mail, :boolean
    add_column :accions, :send_mail, :boolean
    add_column :reports, :send_mail, :boolean
  end
end
