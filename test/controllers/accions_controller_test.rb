require 'test_helper'

class AccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accion = accions(:one)
  end

  test "should get index" do
    get accions_url
    assert_response :success
  end

  test "should get new" do
    get new_accion_url
    assert_response :success
  end

  test "should create accion" do
    assert_difference('Accion.count') do
      post accions_url, params: { accion: { admin_user: @accion.admin_user, codigo: @accion.codigo, contador: @accion.contador, contador_seg: @accion.contador_seg, costo: @accion.costo, cumplio: @accion.cumplio, descripcion: @accion.descripcion, estado: @accion.estado, evidencia: @accion.evidencia, f_compromiso: @accion.f_compromiso, f_real: @accion.f_real, f_seguimiento: @accion.f_seguimiento, responsable: @accion.responsable, tipo: @accion.tipo, user_id: @accion.user_id } }
    end

    assert_redirected_to accion_url(Accion.last)
  end

  test "should show accion" do
    get accion_url(@accion)
    assert_response :success
  end

  test "should get edit" do
    get edit_accion_url(@accion)
    assert_response :success
  end

  test "should update accion" do
    patch accion_url(@accion), params: { accion: { admin_user: @accion.admin_user, codigo: @accion.codigo, contador: @accion.contador, contador_seg: @accion.contador_seg, costo: @accion.costo, cumplio: @accion.cumplio, descripcion: @accion.descripcion, estado: @accion.estado, evidencia: @accion.evidencia, f_compromiso: @accion.f_compromiso, f_real: @accion.f_real, f_seguimiento: @accion.f_seguimiento, responsable: @accion.responsable, tipo: @accion.tipo, user_id: @accion.user_id } }
    assert_redirected_to accion_url(@accion)
  end

  test "should destroy accion" do
    assert_difference('Accion.count', -1) do
      delete accion_url(@accion)
    end

    assert_redirected_to accions_url
  end
end
