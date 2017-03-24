require 'test_helper'

class RiesgosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @riesgo = riesgos(:one)
  end

  test "should get index" do
    get riesgos_url
    assert_response :success
  end

  test "should get new" do
    get new_riesgo_url
    assert_response :success
  end

  test "should create riesgo" do
    assert_difference('Riesgo.count') do
      post riesgos_url, params: { riesgo: { accion_id: @riesgo.accion_id, admin_user: @riesgo.admin_user, clasificacion: @riesgo.clasificacion, descripcion: @riesgo.descripcion, nivel: @riesgo.nivel, report_id: @riesgo.report_id, user_id: @riesgo.user_id } }
    end

    assert_redirected_to riesgo_url(Riesgo.last)
  end

  test "should show riesgo" do
    get riesgo_url(@riesgo)
    assert_response :success
  end

  test "should get edit" do
    get edit_riesgo_url(@riesgo)
    assert_response :success
  end

  test "should update riesgo" do
    patch riesgo_url(@riesgo), params: { riesgo: { accion_id: @riesgo.accion_id, admin_user: @riesgo.admin_user, clasificacion: @riesgo.clasificacion, descripcion: @riesgo.descripcion, nivel: @riesgo.nivel, report_id: @riesgo.report_id, user_id: @riesgo.user_id } }
    assert_redirected_to riesgo_url(@riesgo)
  end

  test "should destroy riesgo" do
    assert_difference('Riesgo.count', -1) do
      delete riesgo_url(@riesgo)
    end

    assert_redirected_to riesgos_url
  end
end
