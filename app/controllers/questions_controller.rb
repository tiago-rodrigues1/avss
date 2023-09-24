class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.station_id = params[:station_id]

    respond_to do |format|
      if @question.save
        format.turbo_stream
        format.html { redirect_to edit_question_path(@question) }
      else
        format.html { render :new }
      end
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_kind
    @question = Question.find(params[:id])
    @question.kind = params[:question][:kind]

    respond_to do |format|
      if @question.save
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
      end
    end
  end

  def new_alternative
    @question = Question.find(params[:id])
    @alternative = QuestionAlternative.new
    @alternative.question = @question

    respond_to do |format|
      if @alternative.save
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
      end
    end
  end

  def remove_alternative
    @question = Question.find(params[:question_id])
    @alternative = QuestionAlternative.find(params[:id])

    @alternative.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@question) }
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:statement, :kind)
    end
end
