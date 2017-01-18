# == Schema Information
#
# Table name: normas
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  admin_user :integer
#  archivo    :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Norma < ApplicationRecord

	belongs_to :user
	has_many :numerals
	mount_uploader :archivo, ArchivoUploader
  


def self.search(search)
            where("name like '%#{search}%' or name like '%#{search.upcase}%' "  )  
        end

end
