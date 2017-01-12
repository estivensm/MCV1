# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  admin_user  :integer
#  state       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Source < ApplicationRecord
	has_many :reports
	def self.search(search)
            where("name like '%#{search}%' or description like '%#{search}%' "  )  
        end
end
