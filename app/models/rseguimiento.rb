class Rseguimiento < ApplicationRecord
	belongs_to :report
	belongs_to :user
	mount_uploader :evidencia, ArchivoRepUploader
end
