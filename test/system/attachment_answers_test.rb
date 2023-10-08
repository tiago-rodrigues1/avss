require "application_system_test_case"

class AttachmentAnswersTest < ApplicationSystemTestCase
  setup do
    @attachment_answer = attachment_answers(:one)
  end

  test "visiting the index" do
    visit attachment_answers_url
    assert_selector "h1", text: "Attachment answers"
  end

  test "should create attachment answer" do
    visit attachment_answers_url
    click_on "New attachment answer"

    fill_in "Question", with: @attachment_answer.question_id
    fill_in "Station submission", with: @attachment_answer.station_submission_id
    click_on "Create Attachment answer"

    assert_text "Attachment answer was successfully created"
    click_on "Back"
  end

  test "should update Attachment answer" do
    visit attachment_answer_url(@attachment_answer)
    click_on "Edit this attachment answer", match: :first

    fill_in "Question", with: @attachment_answer.question_id
    fill_in "Station submission", with: @attachment_answer.station_submission_id
    click_on "Update Attachment answer"

    assert_text "Attachment answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Attachment answer" do
    visit attachment_answer_url(@attachment_answer)
    click_on "Destroy this attachment answer", match: :first

    assert_text "Attachment answer was successfully destroyed"
  end
end
