# == Schema Information
#
# Table name: causas
#
#  id          :integer          not null, primary key
#  tipo        :string
#  descripcion :text
#  archivo     :string
#  admin_user  :integer
#  user_id     :integer
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Causa < ApplicationRecord
	belongs_to :report
	mount_uploader :archivo, ArchivoCausaUploader
	validates :tipo, presence: true 
	has_many :causa_efectos
end
