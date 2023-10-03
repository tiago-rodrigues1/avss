require "application_system_test_case"

class StationSubmissionsTest < ApplicationSystemTestCase
  setup do
    @station_submission = station_submissions(:one)
  end

  test "visiting the index" do
    visit station_submissions_url
    assert_selector "h1", text: "Station submissions"
  end

  test "should create station submission" do
    visit station_submissions_url
    click_on "New station submission"

    fill_in "Circuit submission", with: @station_submission.circuit_submission_id
    fill_in "Station", with: @station_submission.station_id
    click_on "Create Station submission"

    assert_text "Station submission was successfully created"
    click_on "Back"
  end

  test "should update Station submission" do
    visit station_submission_url(@station_submission)
    click_on "Edit this station submission", match: :first

    fill_in "Circuit submission", with: @station_submission.circuit_submission_id
    fill_in "Station", with: @station_submission.station_id
    click_on "Update Station submission"

    assert_text "Station submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Station submission" do
    visit station_submission_url(@station_submission)
    click_on "Destroy this station submission", match: :first

    assert_text "Station submission was successfully destroyed"
  end
end
