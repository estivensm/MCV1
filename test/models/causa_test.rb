# == Schema Information
#
# Table name: causas
#
#  id          :integer          not null, primary key
#  tipo        :string
#  descripcion :text
#  archivo     :string
#  admin_user  :integer
#  user_id     :integer
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CausaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
