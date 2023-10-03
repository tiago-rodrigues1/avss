require "test_helper"

class CircuitApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circuit_application = circuit_applications(:one)
  end

  test "should get index" do
    get circuit_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_circuit_application_url
    assert_response :success
  end

  test "should create circuit_application" do
    assert_difference("CircuitApplication.count") do
      post circuit_applications_url, params: { circuit_application: { circuit_id: @circuit_application.circuit_id, link: @circuit_application.link } }
    end

    assert_redirected_to circuit_application_url(CircuitApplication.last)
  end

  test "should show circuit_application" do
    get circuit_application_url(@circuit_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_circuit_application_url(@circuit_application)
    assert_response :success
  end

  test "should update circuit_application" do
    patch circuit_application_url(@circuit_application), params: { circuit_application: { circuit_id: @circuit_application.circuit_id, link: @circuit_application.link } }
    assert_redirected_to circuit_application_url(@circuit_application)
  end

  test "should destroy circuit_application" do
    assert_difference("CircuitApplication.count", -1) do
      delete circuit_application_url(@circuit_application)
    end

    assert_redirected_to circuit_applications_url
  end
end
