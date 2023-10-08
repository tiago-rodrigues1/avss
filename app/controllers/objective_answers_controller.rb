class ObjectiveAnswersController < ApplicationController
  before_action :set_objective_answer, only: %i[ show edit update destroy ]

  # GET /objective_answers or /objective_answers.json
  def index
    @objective_answers = ObjectiveAnswer.all
  end

  # GET /objective_answers/1 or /objective_answers/1.json
  def show
  end

  # GET /objective_answers/new
  def new
    @objective_answer = ObjectiveAnswer.new
  end

  # GET /objective_answers/1/edit
  def edit
  end

  # POST /objective_answers or /objective_answers.json
  def create
    @objective_answer = ObjectiveAnswer.new(objective_answer_params)

    respond_to do |format|
      if @objective_answer.save
        format.html { redirect_to objective_answer_url(@objective_answer), notice: "Objective answer was successfully created." }
        format.json { render :show, status: :created, location: @objective_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objective_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objective_answers/1 or /objective_answers/1.json
  def update
    respond_to do |format|
      if @objective_answer.update(objective_answer_params)
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end

        format.html { redirect_to objective_answer_url(@objective_answer), notice: "Objective answer was successfully updated." }
        format.json { render :show, status: :ok, location: @objective_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objective_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objective_answers/1 or /objective_answers/1.json
  def destroy
    @objective_answer.destroy

    respond_to do |format|
      format.html { redirect_to objective_answers_url, notice: "Objective answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objective_answer
      @objective_answer = ObjectiveAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def objective_answer_params
      params.require(:objective_answer).permit(:question_alternative_id, :question_id, :station_submission_id)
    end
end
