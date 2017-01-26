require 'test_helper'

class CausasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @causa = causas(:one)
  end

  test "should get index" do
    get causas_url
    assert_response :success
  end

  test "should get new" do
    get new_causa_url
    assert_response :success
  end

  test "should create causa" do
    assert_difference('Causa.count') do
      post causas_url, params: { causa: { admin_user: @causa.admin_user, archivo: @causa.archivo, descripcion: @causa.descripcion, report_id: @causa.report_id, tipo: @causa.tipo, user_id: @causa.user_id } }
    end

    assert_redirected_to causa_url(Causa.last)
  end

  test "should show causa" do
    get causa_url(@causa)
    assert_response :success
  end

  test "should get edit" do
    get edit_causa_url(@causa)
    assert_response :success
  end

  test "should update causa" do
    patch causa_url(@causa), params: { causa: { admin_user: @causa.admin_user, archivo: @causa.archivo, descripcion: @causa.descripcion, report_id: @causa.report_id, tipo: @causa.tipo, user_id: @causa.user_id } }
    assert_redirected_to causa_url(@causa)
  end

  test "should destroy causa" do
    assert_difference('Causa.count', -1) do
      delete causa_url(@causa)
    end

    assert_redirected_to causas_url
  end
end
