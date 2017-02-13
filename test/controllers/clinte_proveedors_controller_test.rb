require 'test_helper'

class ClinteProveedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clinte_proveedor = clinte_proveedors(:one)
  end

  test "should get index" do
    get clinte_proveedors_url
    assert_response :success
  end

  test "should get new" do
    get new_clinte_proveedor_url
    assert_response :success
  end

  test "should create clinte_proveedor" do
    assert_difference('ClinteProveedor.count') do
      post clinte_proveedors_url, params: { clinte_proveedor: { address: @clinte_proveedor.address, admin_user: @clinte_proveedor.admin_user, contact_email: @clinte_proveedor.contact_email, contact_name: @clinte_proveedor.contact_name, contact_telephone: @clinte_proveedor.contact_telephone, correo_empresa: @clinte_proveedor.correo_empresa, name: @clinte_proveedor.name, nit: @clinte_proveedor.nit, pbx: @clinte_proveedor.pbx, tipo: @clinte_proveedor.tipo, user_id: @clinte_proveedor.user_id, web: @clinte_proveedor.web } }
    end

    assert_redirected_to clinte_proveedor_url(ClinteProveedor.last)
  end

  test "should show clinte_proveedor" do
    get clinte_proveedor_url(@clinte_proveedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_clinte_proveedor_url(@clinte_proveedor)
    assert_response :success
  end

  test "should update clinte_proveedor" do
    patch clinte_proveedor_url(@clinte_proveedor), params: { clinte_proveedor: { address: @clinte_proveedor.address, admin_user: @clinte_proveedor.admin_user, contact_email: @clinte_proveedor.contact_email, contact_name: @clinte_proveedor.contact_name, contact_telephone: @clinte_proveedor.contact_telephone, correo_empresa: @clinte_proveedor.correo_empresa, name: @clinte_proveedor.name, nit: @clinte_proveedor.nit, pbx: @clinte_proveedor.pbx, tipo: @clinte_proveedor.tipo, user_id: @clinte_proveedor.user_id, web: @clinte_proveedor.web } }
    assert_redirected_to clinte_proveedor_url(@clinte_proveedor)
  end

  test "should destroy clinte_proveedor" do
    assert_difference('ClinteProveedor.count', -1) do
      delete clinte_proveedor_url(@clinte_proveedor)
    end

    assert_redirected_to clinte_proveedors_url
  end
end
