require 'test_helper'

class ValorationRisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valoration_risk = valoration_risks(:one)
  end

  test "should get index" do
    get valoration_risks_url
    assert_response :success
  end

  test "should get new" do
    get new_valoration_risk_url
    assert_response :success
  end

  test "should create valoration_risk" do
    assert_difference('ValorationRisk.count') do
      post valoration_risks_url, params: { valoration_risk: { admin_user: @valoration_risk.admin_user, analysis: @valoration_risk.analysis, controls: @valoration_risk.controls, impact_indicator: @valoration_risk.impact_indicator, nc_text: @valoration_risk.nc_text, nc_value: @valoration_risk.nc_value, nd_text: @valoration_risk.nd_text, nd_value: @valoration_risk.nd_value, ne_text: @valoration_risk.ne_text, ne_value: @valoration_risk.ne_value, next_valoration: @valoration_risk.next_valoration, np_text: @valoration_risk.np_text, np_value: @valoration_risk.np_value, nr_value: @valoration_risk.nr_value, probability_indicator: @valoration_risk.probability_indicator, riesgo_id: @valoration_risk.riesgo_id, risk_level: @valoration_risk.risk_level, user_id: @valoration_risk.user_id, valoration_date: @valoration_risk.valoration_date } }
    end

    assert_redirected_to valoration_risk_url(ValorationRisk.last)
  end

  test "should show valoration_risk" do
    get valoration_risk_url(@valoration_risk)
    assert_response :success
  end

  test "should get edit" do
    get edit_valoration_risk_url(@valoration_risk)
    assert_response :success
  end

  test "should update valoration_risk" do
    patch valoration_risk_url(@valoration_risk), params: { valoration_risk: { admin_user: @valoration_risk.admin_user, analysis: @valoration_risk.analysis, controls: @valoration_risk.controls, impact_indicator: @valoration_risk.impact_indicator, nc_text: @valoration_risk.nc_text, nc_value: @valoration_risk.nc_value, nd_text: @valoration_risk.nd_text, nd_value: @valoration_risk.nd_value, ne_text: @valoration_risk.ne_text, ne_value: @valoration_risk.ne_value, next_valoration: @valoration_risk.next_valoration, np_text: @valoration_risk.np_text, np_value: @valoration_risk.np_value, nr_value: @valoration_risk.nr_value, probability_indicator: @valoration_risk.probability_indicator, riesgo_id: @valoration_risk.riesgo_id, risk_level: @valoration_risk.risk_level, user_id: @valoration_risk.user_id, valoration_date: @valoration_risk.valoration_date } }
    assert_redirected_to valoration_risk_url(@valoration_risk)
  end

  test "should destroy valoration_risk" do
    assert_difference('ValorationRisk.count', -1) do
      delete valoration_risk_url(@valoration_risk)
    end

    assert_redirected_to valoration_risks_url
  end
end
