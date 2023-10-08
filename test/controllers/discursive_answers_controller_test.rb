require "test_helper"

class DiscursiveAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discursive_answer = discursive_answers(:one)
  end

  test "should get index" do
    get discursive_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_discursive_answer_url
    assert_response :success
  end

  test "should create discursive_answer" do
    assert_difference("DiscursiveAnswer.count") do
      post discursive_answers_url, params: { discursive_answer: { body: @discursive_answer.body, question_id: @discursive_answer.question_id, station_submission_id: @discursive_answer.station_submission_id } }
    end

    assert_redirected_to discursive_answer_url(DiscursiveAnswer.last)
  end

  test "should show discursive_answer" do
    get discursive_answer_url(@discursive_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_discursive_answer_url(@discursive_answer)
    assert_response :success
  end

  test "should update discursive_answer" do
    patch discursive_answer_url(@discursive_answer), params: { discursive_answer: { body: @discursive_answer.body, question_id: @discursive_answer.question_id, station_submission_id: @discursive_answer.station_submission_id } }
    assert_redirected_to discursive_answer_url(@discursive_answer)
  end

  test "should destroy discursive_answer" do
    assert_difference("DiscursiveAnswer.count", -1) do
      delete discursive_answer_url(@discursive_answer)
    end

    assert_redirected_to discursive_answers_url
  end
end
