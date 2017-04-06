require 'test_helper'

class MyTasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_tasks_index_url
    assert_response :success
  end

end
