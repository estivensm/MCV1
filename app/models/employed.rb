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
before_update :update_user
after_create :create_user
before_destroy :destroy_user



mount_uploader :avatare, AvatareUploader

def self.search(search)
            where("first_name like '%#{search}%' or second_name like '%#{search}%' or first_last_name like '%#{search}%' or second_last_name like '%#{search}%' or documente like '%#{search}%' or first_name like '%#{search.upcase}%'"  )  
        end
def update_user
    
    user = User.where(employed_id: self.id).first
    if user != nil
    user.email = self.email
    user.save
end


end


def create_user
emp = Employed.where(admin_user: self.admin_user).count
	if (emp > 1)
		puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        rol = Rol.where(name: "Basico").first.id
        user =User.create(email:self.email,password:self.document,password_confirmation:self.document,rol_id: rol,admin_user:self.admin_user,role:"Basico")
        if user.save
    WelcomeMailer.welcome(self).deliver
            end
  end
	end

	def destroy_user
        
        User.where(email:self.email).where(admin_user:self.admin_user).first.destroy

	end



end
