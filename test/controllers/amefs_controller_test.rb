require 'test_helper'

class AmefsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get amefs_index_url
    assert_response :success
  end

end
