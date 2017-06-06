# == Schema Information
#
# Table name: source_parents
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  user_id     :integer
#  admin_user  :integer
#  codigo      :string
#  tipo        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SourceParentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
