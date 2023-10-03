require "test_helper"

class StationSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_submission = station_submissions(:one)
  end

  test "should get index" do
    get station_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_station_submission_url
    assert_response :success
  end

  test "should create station_submission" do
    assert_difference("StationSubmission.count") do
      post station_submissions_url, params: { station_submission: { circuit_submission_id: @station_submission.circuit_submission_id, station_id: @station_submission.station_id } }
    end

    assert_redirected_to station_submission_url(StationSubmission.last)
  end

  test "should show station_submission" do
    get station_submission_url(@station_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_submission_url(@station_submission)
    assert_response :success
  end

  test "should update station_submission" do
    patch station_submission_url(@station_submission), params: { station_submission: { circuit_submission_id: @station_submission.circuit_submission_id, station_id: @station_submission.station_id } }
    assert_redirected_to station_submission_url(@station_submission)
  end

  test "should destroy station_submission" do
    assert_difference("StationSubmission.count", -1) do
      delete station_submission_url(@station_submission)
    end

    assert_redirected_to station_submissions_url
  end
end
