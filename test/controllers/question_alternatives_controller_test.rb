require "test_helper"

class QuestionAlternativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_alternative = question_alternatives(:one)
  end

  test "should get index" do
    get question_alternatives_url
    assert_response :success
  end

  test "should get new" do
    get new_question_alternative_url
    assert_response :success
  end

  test "should create question_alternative" do
    assert_difference("QuestionAlternative.count") do
      post question_alternatives_url, params: { question_alternative: { body: @question_alternative.body, correct: @question_alternative.correct, question_id: @question_alternative.question_id } }
    end

    assert_redirected_to question_alternative_url(QuestionAlternative.last)
  end

  test "should show question_alternative" do
    get question_alternative_url(@question_alternative)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_alternative_url(@question_alternative)
    assert_response :success
  end

  test "should update question_alternative" do
    patch question_alternative_url(@question_alternative), params: { question_alternative: { body: @question_alternative.body, correct: @question_alternative.correct, question_id: @question_alternative.question_id } }
    assert_redirected_to question_alternative_url(@question_alternative)
  end

  test "should destroy question_alternative" do
    assert_difference("QuestionAlternative.count", -1) do
      delete question_alternative_url(@question_alternative)
    end

    assert_redirected_to question_alternatives_url
  end
end
