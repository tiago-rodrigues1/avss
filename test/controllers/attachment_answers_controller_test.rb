require "test_helper"

class AttachmentAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attachment_answer = attachment_answers(:one)
  end

  test "should get index" do
    get attachment_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_attachment_answer_url
    assert_response :success
  end

  test "should create attachment_answer" do
    assert_difference("AttachmentAnswer.count") do
      post attachment_answers_url, params: { attachment_answer: { question_id: @attachment_answer.question_id, station_submission_id: @attachment_answer.station_submission_id } }
    end

    assert_redirected_to attachment_answer_url(AttachmentAnswer.last)
  end

  test "should show attachment_answer" do
    get attachment_answer_url(@attachment_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_attachment_answer_url(@attachment_answer)
    assert_response :success
  end

  test "should update attachment_answer" do
    patch attachment_answer_url(@attachment_answer), params: { attachment_answer: { question_id: @attachment_answer.question_id, station_submission_id: @attachment_answer.station_submission_id } }
    assert_redirected_to attachment_answer_url(@attachment_answer)
  end

  test "should destroy attachment_answer" do
    assert_difference("AttachmentAnswer.count", -1) do
      delete attachment_answer_url(@attachment_answer)
    end

    assert_redirected_to attachment_answers_url
  end
end
