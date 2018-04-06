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
#  sign_in_count          :integer          default(0), not null
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
#  employed_id            :integer
#  admin                  :boolean
#

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
  after_create :add_adminid2
  before_save :add_adminid1
  before_create :add_adminid

  has_many :tasks
  #before_destroy :validar_detele

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:authentication_keys => [:name]

  mount_uploader :avatar, AvatarUploader
  has_many :procesos
  has_many :causa_efectos
  has_many :cargos
  has_many :companies
  #has_many :employeds
  has_many :reports
  has_many :accions
  has_many :rseguimientos
  has_many :aseguimientos
  belongs_to :rol, optional: true
   #before_destroy :saveable?

  #def saveable?
   # if true
    #  raise "Destroy aborted; you can't do that!"
    #end
  #end
validates :name,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  validates :email,
  :presence => false,
  :uniqueness => false



def email_required?
  false
end
def email_changed?
  false
end

def self.search(search, search1)


           search != "" ? (scope :emailsc, -> { where(email: search) }) : (scope :emailsc, -> { where.not(id: nil) })
           search1 != "" ? (scope :rolsc, -> { where(rol_id: search1) }) : (scope :rolsc, -> { where.not(id: nil) })

            emailsc.rolsc

        end

         def add_adminid2

            if self.role == "SuperAdmin"
         	     Company.create(name: self.company, user_id: self.id, admin_user: self.id)
               Rol.create(admin_user: self.id, user_id: self.id, configuracion: true, report_ver: true, report_crear: true, report_edit: true, report_delete: true, name: "Administrador", report_procesos: false, default: true)
               Rol.create(admin_user: self.id, user_id: self.id, configuracion: false, report_ver: false, report_crear: false, report_edit: false, report_delete: false, name: "Basico", report_procesos: false, default: true)
               Employed.create(email: self.email, admin_user: self.id, user_id: self.id, password: nil ,password_c: nil, user_name:self.name)
               self.employed_id =  Employed.where(admin_user: self.id).last.id
               self.rol_id =  Rol.where(admin_user: self.id).where(name: "Administrador").last.id
               save
               puts "holaaaaaaaa"
               puts  Employed.where(admin_user: self.id).last.id






         	end
         	puts self.id

         end
         def add_adminid1

            if self.role == "SuperAdmin"
              self.admin_user = self.id


          else


          end


         end


          def add_adminid
           if self.role != "SuperAdmin"
           self.employed_id = Employed.where(email: self.email).first.id

          end
         end



end
