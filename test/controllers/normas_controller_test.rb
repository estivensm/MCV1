require 'test_helper'

class NormasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @norma = normas(:one)
  end

  test "should get index" do
    get normas_url
    assert_response :success
  end

  test "should get new" do
    get new_norma_url
    assert_response :success
  end

  test "should create norma" do
    assert_difference('Norma.count') do
      post normas_url, params: { norma: { admin_user: @norma.admin_user, archivo: @norma.archivo, link: @norma.link, name: @norma.name, user_id: @norma.user_id } }
    end

    assert_redirected_to norma_url(Norma.last)
  end

  test "should show norma" do
    get norma_url(@norma)
    assert_response :success
  end

  test "should get edit" do
    get edit_norma_url(@norma)
    assert_response :success
  end

  test "should update norma" do
    patch norma_url(@norma), params: { norma: { admin_user: @norma.admin_user, archivo: @norma.archivo, link: @norma.link, name: @norma.name, user_id: @norma.user_id } }
    assert_redirected_to norma_url(@norma)
  end

  test "should destroy norma" do
    assert_difference('Norma.count', -1) do
      delete norma_url(@norma)
    end

    assert_redirected_to normas_url
  end
end
