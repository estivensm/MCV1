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
#  avatar           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cargo_id         :integer
#  email            :string
#  avatare          :string
#

class Employed < ApplicationRecord

belongs_to :user
belongs_to :cargo
mount_uploader :avatare, AvatareUploader
end