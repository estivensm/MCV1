# == Schema Information
#
# Table name: cargos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  proceso_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  admin_user  :integer
#

class Cargo < ApplicationRecord
	belongs_to :proceso
	belongs_to :user
	has_many :employeds

def self.search(search)
	
            where("name like '%#{search}%' or description like '%#{search}%' "  )  
        end

end
