require 'test_helper'

class MyReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_reports_index_url
    assert_response :success
  end

end
