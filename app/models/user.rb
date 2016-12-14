# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  last_name              :string
#  document               :string
#  document_type          :string
#  avatar                 :string
#  birthday               :date
#  admin_user             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  rol                    :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :add_adminid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  has_many :procesos
  has_and_belongs_to_many :cargos



         def add_adminid

            if self.rol == "SuperAdmin"
         	    self.admin_user = self.id
         	end
         	puts self.id
         	
         end
end
