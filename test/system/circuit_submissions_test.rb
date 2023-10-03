require "application_system_test_case"

class CircuitSubmissionsTest < ApplicationSystemTestCase
  setup do
    @circuit_submission = circuit_submissions(:one)
  end

  test "visiting the index" do
    visit circuit_submissions_url
    assert_selector "h1", text: "Circuit submissions"
  end

  test "should create circuit submission" do
    visit circuit_submissions_url
    click_on "New circuit submission"

    fill_in "Circuit application", with: @circuit_submission.circuit_application_id
    fill_in "Email", with: @circuit_submission.email
    fill_in "Name", with: @circuit_submission.name
    fill_in "Registration", with: @circuit_submission.registration
    click_on "Create Circuit submission"

    assert_text "Circuit submission was successfully created"
    click_on "Back"
  end

  test "should update Circuit submission" do
    visit circuit_submission_url(@circuit_submission)
    click_on "Edit this circuit submission", match: :first

    fill_in "Circuit application", with: @circuit_submission.circuit_application_id
    fill_in "Email", with: @circuit_submission.email
    fill_in "Name", with: @circuit_submission.name
    fill_in "Registration", with: @circuit_submission.registration
    click_on "Update Circuit submission"

    assert_text "Circuit submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Circuit submission" do
    visit circuit_submission_url(@circuit_submission)
    click_on "Destroy this circuit submission", match: :first

    assert_text "Circuit submission was successfully destroyed"
  end
end
