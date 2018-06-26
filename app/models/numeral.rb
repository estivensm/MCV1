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
#  admin       :boolean
#  clausula    :string
#  subtitulo   :string
#  subclausula :string
#

class Numeral < ApplicationRecord
  belongs_to :user
  belongs_to :norma
  has_and_belongs_to_many :reports
  after_create :validar_tipo

  def self.search(search, search1, search2)
	
    search != "" ? (scope :numeralsc, -> { where("numeral like '%#{search.downcase}%' or numeral like '%#{search.upcase}%'  or numeral like '%#{search.capitalize}%' ") }) : (scope :numeralsc, -> { where.not(id: nil) }) 
    search1 != "" ? (scope :descriptionsc, -> { where("description like '%#{search1.downcase}%' or description like '%#{search1.upcase}%'  or description like '%#{search1.capitalize}%' ") }) : (scope :descriptionsc, -> { where.not(id: nil) }) 
    search2 != "" ? (scope :namesc, -> { where("name like '%#{search2.downcase}%' or name like '%#{search2.upcase}%'  or name like '%#{search2.capitalize}%' ") }) : (scope :namesc, -> { where.not(id: nil) }) 
    numeralsc.descriptionsc.namesc


  end


  def validar_tipo
        user = User.where(admin: true).take
        if self.admin_user  == user.id
             self.admin = true
             save
        end
  end


  def self.import(file, admin_user ,user_id, norma, admin)
     spreadsheet = Roo::Spreadsheet.open(file.path)
     header = spreadsheet.row(1)
     (2..spreadsheet.last_row).each do |i|
     row = Hash[[header, spreadsheet.row(i)].transpose]
     numeral = find_by(id: row["id"]) || new
     numeral.attributes = row.to_hash
     numeral.admin_user = admin_user
     numeral.user_id = user_id
     numeral.norma_id = norma
     numeral.admin = admin
     numeral.save!
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
