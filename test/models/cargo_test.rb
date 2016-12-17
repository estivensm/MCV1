# == Schema Information
#
# Table name: cargos
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  proceso_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  admin_user  :integer
#

require 'test_helper'

class CargoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
