require 'test_helper'

class ClienteProveedorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cliente_proveedor_type = cliente_proveedor_types(:one)
  end

  test "should get index" do
    get cliente_proveedor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_cliente_proveedor_type_url
    assert_response :success
  end

  test "should create cliente_proveedor_type" do
    assert_difference('ClienteProveedorType.count') do
      post cliente_proveedor_types_url, params: { cliente_proveedor_type: { admin_user: @cliente_proveedor_type.admin_user, description: @cliente_proveedor_type.description, name: @cliente_proveedor_type.name, user_id: @cliente_proveedor_type.user_id } }
    end

    assert_redirected_to cliente_proveedor_type_url(ClienteProveedorType.last)
  end

  test "should show cliente_proveedor_type" do
    get cliente_proveedor_type_url(@cliente_proveedor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_cliente_proveedor_type_url(@cliente_proveedor_type)
    assert_response :success
  end

  test "should update cliente_proveedor_type" do
    patch cliente_proveedor_type_url(@cliente_proveedor_type), params: { cliente_proveedor_type: { admin_user: @cliente_proveedor_type.admin_user, description: @cliente_proveedor_type.description, name: @cliente_proveedor_type.name, user_id: @cliente_proveedor_type.user_id } }
    assert_redirected_to cliente_proveedor_type_url(@cliente_proveedor_type)
  end

  test "should destroy cliente_proveedor_type" do
    assert_difference('ClienteProveedorType.count', -1) do
      delete cliente_proveedor_type_url(@cliente_proveedor_type)
    end

    assert_redirected_to cliente_proveedor_types_url
  end
end
