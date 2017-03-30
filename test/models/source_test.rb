# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  admin_user  :integer
#  state       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  default     :boolean
#  accion      :boolean
#  correccion  :boolean
#  causa       :boolean
#  puede_ac    :boolean
#  codigo      :string
#  tipo        :string
#  balon       :boolean
#  evidencia   :boolean
#  requisito   :boolean
#  numerales   :boolean
#

require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
