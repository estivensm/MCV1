require 'test_helper'

class RseguimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rseguimiento = rseguimientos(:one)
  end

  test "should get index" do
    get rseguimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_rseguimiento_url
    assert_response :success
  end

  test "should create rseguimiento" do
    assert_difference('Rseguimiento.count') do
      post rseguimientos_url, params: { rseguimiento: { admin_user: @rseguimiento.admin_user, descripcion: @rseguimiento.descripcion, evidencia: @rseguimiento.evidencia, f_seguimiento: @rseguimiento.f_seguimiento, report_id: @rseguimiento.report_id, user_id: @rseguimiento.user_id } }
    end

    assert_redirected_to rseguimiento_url(Rseguimiento.last)
  end

  test "should show rseguimiento" do
    get rseguimiento_url(@rseguimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_rseguimiento_url(@rseguimiento)
    assert_response :success
  end

  test "should update rseguimiento" do
    patch rseguimiento_url(@rseguimiento), params: { rseguimiento: { admin_user: @rseguimiento.admin_user, descripcion: @rseguimiento.descripcion, evidencia: @rseguimiento.evidencia, f_seguimiento: @rseguimiento.f_seguimiento, report_id: @rseguimiento.report_id, user_id: @rseguimiento.user_id } }
    assert_redirected_to rseguimiento_url(@rseguimiento)
  end

  test "should destroy rseguimiento" do
    assert_difference('Rseguimiento.count', -1) do
      delete rseguimiento_url(@rseguimiento)
    end

    assert_redirected_to rseguimientos_url
  end
end
