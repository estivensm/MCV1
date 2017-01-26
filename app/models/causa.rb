class Causa < ApplicationRecord
	belongs_to :report
	mount_uploader :archivo, ArchivoCausaUploader
	validates :tipo, presence: true 
end
