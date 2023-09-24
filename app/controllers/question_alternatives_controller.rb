class QuestionAlternativesController < ApplicationController
  before_action :set_question_alternative, only: %i[ show edit update destroy ]

  # GET /question_alternatives or /question_alternatives.json
  def index
    @question_alternatives = QuestionAlternative.all
  end

  # GET /question_alternatives/1 or /question_alternatives/1.json
  def show
  end

  # GET /question_alternatives/new
  def new
    @question_alternative = QuestionAlternative.new
    @question_alternative.question_id = params[:question_id]
    @id = params[:question_id]

    respond_to do |format|
      if @question_alternative.save
        format.html { redirect_to edit_question_alternative_path(@question_alternative) }
      end
    end
  end

  # GET /question_alternatives/1/edit
  def edit
  end

  # POST /question_alternatives or /question_alternatives.json
  def create
    @question_alternative = QuestionAlternative.new(question_alternative_params)

    respond_to do |format|
      if @question_alternative.save
        format.html { redirect_to question_alternative_url(@question_alternative), notice: "Question alternative was successfully created." }
        format.json { render :show, status: :created, location: @question_alternative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_alternatives/1 or /question_alternatives/1.json
  def update
    respond_to do |format|
      if @question_alternative.update(question_alternative_params)
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to question_alternative_url(@question_alternative), notice: "Question alternative was successfully updated." }
        format.json { render :show, status: :ok, location: @question_alternative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_alternatives/1 or /question_alternatives/1.json
  def destroy
    @question_alternative.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to question_alternatives_url, notice: "Question alternative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_alternative
      @question_alternative = QuestionAlternative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_alternative_params
      params.require(:question_alternative).permit(:body, :question_id, :correct)
    end
end
