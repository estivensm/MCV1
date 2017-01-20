# == Schema Information
#
# Table name: numerals
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  admin_user  :integer
#  norma_id    :integer
#  description :text
#  numeral     :string
#  norma_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Numeral < ApplicationRecord
belongs_to :user
belongs_to :norma
has_and_belongs_to_many :reports

def self.search(search)
            where("name like '%#{search}%' or numeral like '%#{search}%' "  )  
        end

end
