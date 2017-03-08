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
end
