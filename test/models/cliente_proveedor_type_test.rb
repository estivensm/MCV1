# == Schema Information
#
# Table name: cliente_proveedor_types
#
#  id          :integer          not null, primary key
#  admin_user  :integer
#  user_id     :integer
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ClienteProveedorTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
