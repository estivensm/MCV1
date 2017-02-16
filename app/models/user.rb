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
#  avatar                 :string
#  admin_user             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company                :string
#  rol_id                 :integer
#  role                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :add_adminid
  before_save :add_adminid1

  #before_destroy :validar_detele

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  has_many :procesos
  has_many :cargos
  has_many :companies
  has_many :employeds
  has_many :reports
  has_many :accions
  has_many :rseguimientos
  has_many :aseguimientos
  belongs_to :rol
   #before_destroy :saveable?

  #def saveable?
   # if true
    #  raise "Destroy aborted; you can't do that!"
    #end
  #end


def self.search(search)
            where("name like '%#{search}%' or email like '%#{search}%' or rol like '%#{search}%'"  )  
        end

         def add_adminid

            if self.role == "SuperAdmin"
         	     Company.create(name: self.company, user_id: self.id)
               Employed.create(email: self.email, admin_user: self.id, user_id: self.id)

         	end
         	puts self.id
         	
         end
         def add_adminid1

            if self.role == "SuperAdmin"
              self.admin_user = self.id
              
          else
            e = Employed.where(email: self.email).first
            self.name = e.first_name + " " + e.first_last_name 

          end 
          
          
         end

        
end


