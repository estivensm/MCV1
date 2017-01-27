require 'test_helper'

class AseguimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aseguimiento = aseguimientos(:one)
  end

  test "should get index" do
    get aseguimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_aseguimiento_url
    assert_response :success
  end

  test "should create aseguimiento" do
    assert_difference('Aseguimiento.count') do
      post aseguimientos_url, params: { aseguimiento: { admin_user: @aseguimiento.admin_user, cierra: @aseguimiento.cierra, conclucion: @aseguimiento.conclucion, costo: @aseguimiento.costo, descripcion: @aseguimiento.descripcion, eficaz: @aseguimiento.eficaz, evidencia: @aseguimiento.evidencia, f_seguimiento: @aseguimiento.f_seguimiento, user_id: @aseguimiento.user_id } }
    end

    assert_redirected_to aseguimiento_url(Aseguimiento.last)
  end

  test "should show aseguimiento" do
    get aseguimiento_url(@aseguimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_aseguimiento_url(@aseguimiento)
    assert_response :success
  end

  test "should update aseguimiento" do
    patch aseguimiento_url(@aseguimiento), params: { aseguimiento: { admin_user: @aseguimiento.admin_user, cierra: @aseguimiento.cierra, conclucion: @aseguimiento.conclucion, costo: @aseguimiento.costo, descripcion: @aseguimiento.descripcion, eficaz: @aseguimiento.eficaz, evidencia: @aseguimiento.evidencia, f_seguimiento: @aseguimiento.f_seguimiento, user_id: @aseguimiento.user_id } }
    assert_redirected_to aseguimiento_url(@aseguimiento)
  end

  test "should destroy aseguimiento" do
    assert_difference('Aseguimiento.count', -1) do
      delete aseguimiento_url(@aseguimiento)
    end

    assert_redirected_to aseguimientos_url
  end
end
