class CircuitSubmissionsController < ApplicationController
  before_action :set_circuit_submission, only: %i[ show edit update destroy view_answers ]

  def view_answers

  end
  
  # GET /circuit_submissions or /circuit_submissions.json
  def index
    @circuit_submissions = CircuitSubmission.all
  end

  # GET /circuit_submissions/1 or /circuit_submissions/1.json
  def show
    @circuit_application = @circuit_submission.circuit_application
    @circuit = @circuit_application.circuit
  end

  # GET /circuit_submissions/new
  def new
    @circuit_submission = CircuitSubmission.new
    @circuit_submission.circuit_application_id = params[:circuit_application_id]
  end

  # GET /circuit_submissions/1/edit
  def edit
  end

  # POST /circuit_submissions or /circuit_submissions.json
  def create
    @circuit_submission = CircuitSubmission.new(circuit_submission_params)

    respond_to do |format|
      if @circuit_submission.save
        format.html { redirect_to circuit_submission_url(@circuit_submission), notice: "Circuit submission was successfully created." }
        format.json { render :show, status: :created, location: @circuit_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @circuit_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circuit_submissions/1 or /circuit_submissions/1.json
  def update
    respond_to do |format|
      if @circuit_submission.update(circuit_submission_params)
        format.html { redirect_to circuit_submission_url(@circuit_submission), notice: "Circuit submission was successfully updated." }
        format.json { render :show, status: :ok, location: @circuit_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @circuit_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circuit_submissions/1 or /circuit_submissions/1.json
  def destroy
    @circuit_submission.destroy

    respond_to do |format|
      format.html { redirect_to circuit_submissions_url, notice: "Circuit submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circuit_submission
      @circuit_submission = CircuitSubmission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def circuit_submission_params
      params.require(:circuit_submission).permit(:circuit_application_id, :name, :email, :registration)
    end
end
