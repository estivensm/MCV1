# == Schema Information
#
# Table name: rseguimientos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  admin_user    :integer
#  f_seguimiento :date
#  descripcion   :text
#  report_id     :integer
#  evidencia     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Rseguimiento < ApplicationRecord
	belongs_to :report
	belongs_to :user
	mount_uploader :evidencia, ArchivoRepUploader
end
