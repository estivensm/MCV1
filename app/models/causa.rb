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
#  primera_m   :string
#  seguna_m    :string
#  tercera_m   :string
#  cuarta_m    :string
#  quinta_m    :string
#  sexta_m     :string
#

class Causa < ApplicationRecord
	belongs_to :report
	mount_uploader :archivo, ArchivoCausaUploader
	validates :tipo, presence: true 
	has_many :causa_efectos

end
