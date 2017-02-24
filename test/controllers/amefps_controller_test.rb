require 'test_helper'

class AmefpsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get amefps_show_url
    assert_response :success
  end

end
