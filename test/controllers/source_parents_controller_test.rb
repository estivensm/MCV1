require 'test_helper'

class SourceParentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_parent = source_parents(:one)
  end

  test "should get index" do
    get source_parents_url
    assert_response :success
  end

  test "should get new" do
    get new_source_parent_url
    assert_response :success
  end

  test "should create source_parent" do
    assert_difference('SourceParent.count') do
      post source_parents_url, params: { source_parent: { admin_user: @source_parent.admin_user, codigo: @source_parent.codigo, description: @source_parent.description, name: @source_parent.name, tipo: @source_parent.tipo, user_id: @source_parent.user_id } }
    end

    assert_redirected_to source_parent_url(SourceParent.last)
  end

  test "should show source_parent" do
    get source_parent_url(@source_parent)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_parent_url(@source_parent)
    assert_response :success
  end

  test "should update source_parent" do
    patch source_parent_url(@source_parent), params: { source_parent: { admin_user: @source_parent.admin_user, codigo: @source_parent.codigo, description: @source_parent.description, name: @source_parent.name, tipo: @source_parent.tipo, user_id: @source_parent.user_id } }
    assert_redirected_to source_parent_url(@source_parent)
  end

  test "should destroy source_parent" do
    assert_difference('SourceParent.count', -1) do
      delete source_parent_url(@source_parent)
    end

    assert_redirected_to source_parents_url
  end
end
