require "test_helper"

class ObjectiveAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objective_answer = objective_answers(:one)
  end

  test "should get index" do
    get objective_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_objective_answer_url
    assert_response :success
  end

  test "should create objective_answer" do
    assert_difference("ObjectiveAnswer.count") do
      post objective_answers_url, params: { objective_answer: { question_alternative_id: @objective_answer.question_alternative_id, question_id: @objective_answer.question_id, station_submission_id: @objective_answer.station_submission_id } }
    end

    assert_redirected_to objective_answer_url(ObjectiveAnswer.last)
  end

  test "should show objective_answer" do
    get objective_answer_url(@objective_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_objective_answer_url(@objective_answer)
    assert_response :success
  end

  test "should update objective_answer" do
    patch objective_answer_url(@objective_answer), params: { objective_answer: { question_alternative_id: @objective_answer.question_alternative_id, question_id: @objective_answer.question_id, station_submission_id: @objective_answer.station_submission_id } }
    assert_redirected_to objective_answer_url(@objective_answer)
  end

  test "should destroy objective_answer" do
    assert_difference("ObjectiveAnswer.count", -1) do
      delete objective_answer_url(@objective_answer)
    end

    assert_redirected_to objective_answers_url
  end
end
