require 'test_helper'

class CausaEfectosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get causa_efectos_create_url
    assert_response :success
  end

  test "should get udpate" do
    get causa_efectos_udpate_url
    assert_response :success
  end

  test "should get destroy" do
    get causa_efectos_destroy_url
    assert_response :success
  end

end
