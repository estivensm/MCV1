# == Schema Information
#
# Table name: employeds
#
#  id               :integer          not null, primary key
#  first_name       :string
#  second_name      :string
#  first_last_name  :string
#  second_last_name :string
#  document_type    :string
#  document         :string
#  birth_date       :date
#  genero           :string
#  admin_user       :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cargo_id         :integer
#  email            :string
#  avatare          :string
#

class Employed < ApplicationRecord
has_and_belongs_to_many :reports
has_and_belongs_to_many :accions
belongs_to :user
belongs_to :cargo
mount_uploader :avatare, AvatareUploader
def self.search(search)
            where("first_name like '%#{search}%' or second_name like '%#{search}%' or first_last_name like '%#{search}%' or second_last_name like '%#{search}%' or documente like '%#{search}%' or first_name like '%#{search.upcase}%'"  )  
        end
end
