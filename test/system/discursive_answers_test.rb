require "application_system_test_case"

class DiscursiveAnswersTest < ApplicationSystemTestCase
  setup do
    @discursive_answer = discursive_answers(:one)
  end

  test "visiting the index" do
    visit discursive_answers_url
    assert_selector "h1", text: "Discursive answers"
  end

  test "should create discursive answer" do
    visit discursive_answers_url
    click_on "New discursive answer"

    fill_in "Body", with: @discursive_answer.body
    fill_in "Question", with: @discursive_answer.question_id
    fill_in "Station submission", with: @discursive_answer.station_submission_id
    click_on "Create Discursive answer"

    assert_text "Discursive answer was successfully created"
    click_on "Back"
  end

  test "should update Discursive answer" do
    visit discursive_answer_url(@discursive_answer)
    click_on "Edit this discursive answer", match: :first

    fill_in "Body", with: @discursive_answer.body
    fill_in "Question", with: @discursive_answer.question_id
    fill_in "Station submission", with: @discursive_answer.station_submission_id
    click_on "Update Discursive answer"

    assert_text "Discursive answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Discursive answer" do
    visit discursive_answer_url(@discursive_answer)
    click_on "Destroy this discursive answer", match: :first

    assert_text "Discursive answer was successfully destroyed"
  end
end
