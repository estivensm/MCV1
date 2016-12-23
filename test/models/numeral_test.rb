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
#

require 'test_helper'

class NumeralTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
