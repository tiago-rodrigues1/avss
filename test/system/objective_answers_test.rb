require "application_system_test_case"

class ObjectiveAnswersTest < ApplicationSystemTestCase
  setup do
    @objective_answer = objective_answers(:one)
  end

  test "visiting the index" do
    visit objective_answers_url
    assert_selector "h1", text: "Objective answers"
  end

  test "should create objective answer" do
    visit objective_answers_url
    click_on "New objective answer"

    fill_in "Question alternative", with: @objective_answer.question_alternative_id
    fill_in "Question", with: @objective_answer.question_id
    fill_in "Station submission", with: @objective_answer.station_submission_id
    click_on "Create Objective answer"

    assert_text "Objective answer was successfully created"
    click_on "Back"
  end

  test "should update Objective answer" do
    visit objective_answer_url(@objective_answer)
    click_on "Edit this objective answer", match: :first

    fill_in "Question alternative", with: @objective_answer.question_alternative_id
    fill_in "Question", with: @objective_answer.question_id
    fill_in "Station submission", with: @objective_answer.station_submission_id
    click_on "Update Objective answer"

    assert_text "Objective answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Objective answer" do
    visit objective_answer_url(@objective_answer)
    click_on "Destroy this objective answer", match: :first

    assert_text "Objective answer was successfully destroyed"
  end
end
