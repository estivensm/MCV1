require 'test_helper'

class MyAccionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_accions_index_url
    assert_response :success
  end

end
