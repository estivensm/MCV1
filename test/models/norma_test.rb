# == Schema Information
#
# Table name: normas
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  admin_user :integer
#  archivo    :string
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NormaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
