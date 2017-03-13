# == Schema Information
#
# Table name: clinte_proveedors
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  admin_user        :integer
#  name              :string
#  pbx               :string
#  address           :string
#  nit               :string
#  correo_empresa    :string
#  contact_name      :string
#  contact_telephone :string
#  contact_email     :string
#  tipo              :string
#  web               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ClinteProveedor < ApplicationRecord
  has_many :contacts , inverse_of: :clinte_proveedor, dependent: :destroy
  
    has_many :reports
  accepts_nested_attributes_for :contacts, :allow_destroy => true


def self.search(search,search1,search2)

        search != "" ? (scope :namep, -> { where("name like '%#{search.downcase}%' or name like '%#{search.upcase}%'  or name like '%#{search.capitalize}%' ") }) : (scope :namep, -> { where.not(id: nil) }) 
        search1 != "" ? (scope :nitp, -> { where("nit like '%#{search1.downcase}%' or name like '%#{search1.upcase}%'  or name like '%#{search1.capitalize}%' ") }) : (scope :nitp, -> { where.not(id: nil) }) 
        search2 != "" ? (scope :emailp, -> { where("correo_empresa like '%#{search2.downcase}%' or correo_empresa like '%#{search2.upcase}%'  or correo_empresa like '%#{search2.capitalize}%' ") }) : (scope :emailp, -> { where.not(id: nil) }) 
       # search3 != "" ? (scope :tipop, -> { where(tipo: search4) }) : (scope :tipop, -> { where.not(id: nil) }) 

                   namep.nitp.emailp
           
 end



def self.import(file, admin_user ,user_id)
   spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    clinte_proveedor = find_by(id: row["id"]) || new
    clinte_proveedor.attributes = row.to_hash
    clinte_proveedor.admin_user = admin_user
    clinte_proveedor.user_id = user_id

    clinte_proveedor.save!
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
