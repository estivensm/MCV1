# == Schema Information
#
# Table name: page_documents
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#  admin_user  :integer
#  file        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PageDocument < ApplicationRecord
	mount_uploader :file, PageFileUploader
end
