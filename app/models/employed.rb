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
#belongs_to :user
belongs_to :cargo, optional: true
before_update :update_user
after_create :create_user
before_destroy :destroy_user
has_many :tasks


mount_uploader :avatare, AvatareUploader

def self.search(search, search1, search2, search3)

            search  != "" ? (scope :nombres, -> { where("first_name like '%#{search.downcase}%' or first_name like '%#{search.upcase}%'  or first_name like '%#{search.capitalize}%' or second_name like '%#{search.downcase}%' or second_name like '%#{search.upcase}%'  or second_name like '%#{search.capitalize}%' ") }) : (scope :nombres, -> { where.not(id: nil) })
            search1 != ""  ? (scope :apellidos, -> { where("first_last_name like '%#{search1.downcase}%' or first_last_name like '%#{search1.upcase}%'  or first_last_name like '%#{search1.capitalize}%' or second_last_name like '%#{search1.downcase}%' or second_last_name like '%#{search1.upcase}%'  or second_last_name like '%#{search1.capitalize}%'") }) : (scope :apellidos, -> { where.not(id: nil) })
            search2 != ""  ? (scope :emailsc, -> { where("email like '%#{search2.downcase}%' or email like '%#{search2.upcase}%'  or email like '%#{search2.capitalize}%' ") }) : (scope :emailsc, -> { where.not(id: nil) })
            search3 != "" ? (scope :cargosc, -> { where(cargo_id: search3) }) : (scope :cargosc, -> { where.not(id: nil) })
            nombres.apellidos.emailsc.cargosc


 end



def update_user

    user = User.where(employed_id: self.id).first
    if user != nil
    user.email = self.email
    user.password_confirmation = self.document
    user.save
end


end

def create_user
emp = Employed.where(admin_user: self.admin_user).count
    	if (emp > 1)
    	 rol = Rol.where(name: "Basico").first.id
       User.create(email:self.email,password:self.document,password_confirmation:self.document,rol_id: rol,admin_user:self.admin_user,role:"Basico",name: self.first_name)
       puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
       save
      # WelcomeMailer.welcome(self).deliver
      # end
end
end

	def destroy_user
        if User.where(email:self.email).where(admin_user:self.admin_user).count != 0
        User.where(email:self.email).where(admin_user:self.admin_user).first.destroy
        end
	end



def self.import(file, admin_user ,user_id)
   spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    employed = find_by(id: row["id"]) || new
    employed.attributes = row.to_hash
    employed.admin_user = admin_user
     employed.user_id = user_id
    employed.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end



end
