require "test_helper"

class CircuitSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @circuit_submission = circuit_submissions(:one)
  end

  test "should get index" do
    get circuit_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_circuit_submission_url
    assert_response :success
  end

  test "should create circuit_submission" do
    assert_difference("CircuitSubmission.count") do
      post circuit_submissions_url, params: { circuit_submission: { circuit_application_id: @circuit_submission.circuit_application_id, email: @circuit_submission.email, name: @circuit_submission.name, registration: @circuit_submission.registration } }
    end

    assert_redirected_to circuit_submission_url(CircuitSubmission.last)
  end

  test "should show circuit_submission" do
    get circuit_submission_url(@circuit_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_circuit_submission_url(@circuit_submission)
    assert_response :success
  end

  test "should update circuit_submission" do
    patch circuit_submission_url(@circuit_submission), params: { circuit_submission: { circuit_application_id: @circuit_submission.circuit_application_id, email: @circuit_submission.email, name: @circuit_submission.name, registration: @circuit_submission.registration } }
    assert_redirected_to circuit_submission_url(@circuit_submission)
  end

  test "should destroy circuit_submission" do
    assert_difference("CircuitSubmission.count", -1) do
      delete circuit_submission_url(@circuit_submission)
    end

    assert_redirected_to circuit_submissions_url
  end
end
