# == Schema Information
#
# Table name: contacts
#
#  id                  :integer          not null, primary key
#  name                :string
#  mobil               :string
#  email               :string
#  cargo               :string
#  clinte_proveedor_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Contact < ApplicationRecord
	belongs_to :clinte_proveedor , inverse_of: :contacts
  


end
