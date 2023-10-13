class DiscursiveAnswersController < ApplicationController
  before_action :set_discursive_answer, only: %i[ show edit update destroy ]

  # GET /discursive_answers or /discursive_answers.json
  def index
    @discursive_answers = DiscursiveAnswer.all
  end

  # GET /discursive_answers/1 or /discursive_answers/1.json
  def show
  end

  # GET /discursive_answers/new
  def new
    @discursive_answer = DiscursiveAnswer.new
  end

  # GET /discursive_answers/1/edit
  def edit
  end

  # POST /discursive_answers or /discursive_answers.json
  def create
    @discursive_answer = DiscursiveAnswer.new(discursive_answer_params)

    respond_to do |format|
      if @discursive_answer.save
        format.html { redirect_to discursive_answer_url(@discursive_answer), notice: "Discursive answer was successfully created." }
        format.json { render :show, status: :created, location: @discursive_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discursive_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discursive_answers/1 or /discursive_answers/1.json
  def update
    respond_to do |format|
      if @discursive_answer.update(discursive_answer_params)
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to discursive_answer_url(@discursive_answer), notice: "Discursive answer was successfully updated." }
        format.json { render :show, status: :ok, location: @discursive_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discursive_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discursive_answers/1 or /discursive_answers/1.json
  def destroy
    @discursive_answer.destroy

    respond_to do |format|
      format.html { redirect_to discursive_answers_url, notice: "Discursive answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discursive_answer
      @discursive_answer = DiscursiveAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discursive_answer_params
      params.require(:discursive_answer).permit(:question_id, :station_submission_id, :body, :points)
    end
end
