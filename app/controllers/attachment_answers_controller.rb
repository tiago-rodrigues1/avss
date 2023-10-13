class AttachmentAnswersController < ApplicationController
  before_action :set_attachment_answer, only: %i[ show edit update destroy ]

  # GET /attachment_answers or /attachment_answers.json
  def index
    @attachment_answers = AttachmentAnswer.all
  end

  # GET /attachment_answers/1 or /attachment_answers/1.json
  def show
  end

  # GET /attachment_answers/new
  def new
    @attachment_answer = AttachmentAnswer.new
  end

  # GET /attachment_answers/1/edit
  def edit
  end

  # POST /attachment_answers or /attachment_answers.json
  def create
    @attachment_answer = AttachmentAnswer.new(attachment_answer_params)

    respond_to do |format|
      if @attachment_answer.save
        format.html { redirect_to attachment_answer_url(@attachment_answer), notice: "Attachment answer was successfully created." }
        format.json { render :show, status: :created, location: @attachment_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachment_answers/1 or /attachment_answers/1.json
  def update
    respond_to do |format|
      if @attachment_answer.update(attachment_answer_params)
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to attachment_answer_url(@attachment_answer), notice: "Attachment answer was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachment_answers/1 or /attachment_answers/1.json
  def destroy
    @attachment_answer.destroy

    respond_to do |format|
      format.html { redirect_to attachment_answers_url, notice: "Attachment answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment_answer
      @attachment_answer = AttachmentAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_answer_params
      params.require(:attachment_answer).permit(:question_id, :station_submission_id, :payload, :points)
    end
end
