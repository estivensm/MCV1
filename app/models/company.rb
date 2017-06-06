# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  logo       :string
#  phone      :string
#  address    :string
#  nit        :string
#  user_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_user :integer
#

class Company < ApplicationRecord

	belongs_to :user
	mount_uploader :logo, LogoUploader

end
