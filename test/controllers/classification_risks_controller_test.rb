require 'test_helper'

class ClassificationRisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classification_risk = classification_risks(:one)
  end

  test "should get index" do
    get classification_risks_url
    assert_response :success
  end

  test "should get new" do
    get new_classification_risk_url
    assert_response :success
  end

  test "should create classification_risk" do
    assert_difference('ClassificationRisk.count') do
      post classification_risks_url, params: { classification_risk: { admin_user: @classification_risk.admin_user, context: @classification_risk.context, description: @classification_risk.description, name: @classification_risk.name, user_id: @classification_risk.user_id } }
    end

    assert_redirected_to classification_risk_url(ClassificationRisk.last)
  end

  test "should show classification_risk" do
    get classification_risk_url(@classification_risk)
    assert_response :success
  end

  test "should get edit" do
    get edit_classification_risk_url(@classification_risk)
    assert_response :success
  end

  test "should update classification_risk" do
    patch classification_risk_url(@classification_risk), params: { classification_risk: { admin_user: @classification_risk.admin_user, context: @classification_risk.context, description: @classification_risk.description, name: @classification_risk.name, user_id: @classification_risk.user_id } }
    assert_redirected_to classification_risk_url(@classification_risk)
  end

  test "should destroy classification_risk" do
    assert_difference('ClassificationRisk.count', -1) do
      delete classification_risk_url(@classification_risk)
    end

    assert_redirected_to classification_risks_url
  end
end
