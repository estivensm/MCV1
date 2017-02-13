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

require 'test_helper'

class ClinteProveedorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
