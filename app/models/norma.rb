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
	has_many :numerals , dependent: :destroy
	mount_uploader :archivo, ArchivoUploader
  

def self.search(search)
           search!= "" ? (scope :namesc, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
 
     namesc
        end

end
