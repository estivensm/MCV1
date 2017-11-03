class PageDocument < ApplicationRecord
	mount_uploader :file, PageFileUploader
end
