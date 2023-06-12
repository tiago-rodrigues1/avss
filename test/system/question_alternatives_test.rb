require "application_system_test_case"

class QuestionAlternativesTest < ApplicationSystemTestCase
  setup do
    @question_alternative = question_alternatives(:one)
  end

  test "visiting the index" do
    visit question_alternatives_url
    assert_selector "h1", text: "Question alternatives"
  end

  test "should create question alternative" do
    visit question_alternatives_url
    click_on "New question alternative"

    fill_in "Body", with: @question_alternative.body
    check "Correct" if @question_alternative.correct
    fill_in "Question", with: @question_alternative.question_id
    click_on "Create Question alternative"

    assert_text "Question alternative was successfully created"
    click_on "Back"
  end

  test "should update Question alternative" do
    visit question_alternative_url(@question_alternative)
    click_on "Edit this question alternative", match: :first

    fill_in "Body", with: @question_alternative.body
    check "Correct" if @question_alternative.correct
    fill_in "Question", with: @question_alternative.question_id
    click_on "Update Question alternative"

    assert_text "Question alternative was successfully updated"
    click_on "Back"
  end

  test "should destroy Question alternative" do
    visit question_alternative_url(@question_alternative)
    click_on "Destroy this question alternative", match: :first

    assert_text "Question alternative was successfully destroyed"
  end
end
