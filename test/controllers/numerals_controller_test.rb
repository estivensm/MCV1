require 'test_helper'

class NumeralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @numeral = numerals(:one)
  end

  test "should get index" do
    get numerals_url
    assert_response :success
  end

  test "should get new" do
    get new_numeral_url
    assert_response :success
  end

  test "should create numeral" do
    assert_difference('Numeral.count') do
      post numerals_url, params: { numeral: { admin_user: @numeral.admin_user, description: @numeral.description, name: @numeral.name, norma: @numeral.norma, norma_id: @numeral.norma_id, numeral: @numeral.numeral, user_id: @numeral.user_id } }
    end

    assert_redirected_to numeral_url(Numeral.last)
  end

  test "should show numeral" do
    get numeral_url(@numeral)
    assert_response :success
  end

  test "should get edit" do
    get edit_numeral_url(@numeral)
    assert_response :success
  end

  test "should update numeral" do
    patch numeral_url(@numeral), params: { numeral: { admin_user: @numeral.admin_user, description: @numeral.description, name: @numeral.name, norma: @numeral.norma, norma_id: @numeral.norma_id, numeral: @numeral.numeral, user_id: @numeral.user_id } }
    assert_redirected_to numeral_url(@numeral)
  end

  test "should destroy numeral" do
    assert_difference('Numeral.count', -1) do
      delete numeral_url(@numeral)
    end

    assert_redirected_to numerals_url
  end
end
