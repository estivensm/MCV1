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
#  password         :string
#  password_c       :string
#  is_user          :boolean
#  user_name        :string
#  rol_id           :integer
#

require 'test_helper'

class EmployedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
