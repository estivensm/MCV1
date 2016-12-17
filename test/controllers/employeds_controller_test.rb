require 'test_helper'

class EmployedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employed = employeds(:one)
  end

  test "should get index" do
    get employeds_url
    assert_response :success
  end

  test "should get new" do
    get new_employed_url
    assert_response :success
  end

  test "should create employed" do
    assert_difference('Employed.count') do
      post employeds_url, params: { employed: { admin_user: @employed.admin_user, avatar: @employed.avatar, birth_date: @employed.birth_date, document: @employed.document, document_type: @employed.document_type, first_last_name: @employed.first_last_name, first_name: @employed.first_name, genero: @employed.genero, second_last_name: @employed.second_last_name, second_name: @employed.second_name, user_id: @employed.user_id } }
    end

    assert_redirected_to employed_url(Employed.last)
  end

  test "should show employed" do
    get employed_url(@employed)
    assert_response :success
  end

  test "should get edit" do
    get edit_employed_url(@employed)
    assert_response :success
  end

  test "should update employed" do
    patch employed_url(@employed), params: { employed: { admin_user: @employed.admin_user, avatar: @employed.avatar, birth_date: @employed.birth_date, document: @employed.document, document_type: @employed.document_type, first_last_name: @employed.first_last_name, first_name: @employed.first_name, genero: @employed.genero, second_last_name: @employed.second_last_name, second_name: @employed.second_name, user_id: @employed.user_id } }
    assert_redirected_to employed_url(@employed)
  end

  test "should destroy employed" do
    assert_difference('Employed.count', -1) do
      delete employed_url(@employed)
    end

    assert_redirected_to employeds_url
  end
end
