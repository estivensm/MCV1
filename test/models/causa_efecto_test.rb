# == Schema Information
#
# Table name: causa_efectos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  admin_user :integer
#  nivel      :string
#  causa      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tipo       :string
#  report_id  :integer
#  causa_id   :integer
#

require 'test_helper'

class CausaEfectoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
