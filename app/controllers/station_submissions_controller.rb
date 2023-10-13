class StationSubmissionsController < ApplicationController
  before_action :set_station_submission, only: %i[ show edit update destroy ]

  # GET /station_submissions or /station_submissions.json
  def index
    @station_submissions = StationSubmission.all
  end

  # GET /station_submissions/1 or /station_submissions/1.json
  def show
  end

  # GET /station_submissions/new
  def new
    @station_submission = StationSubmission.new
  end

  # GET /station_submissions/1/edit
  def edit
    @station = @station_submission.station
    @circuit_submission = @station_submission.circuit_submission
    @remaining_time = @station.time * 60 - (Time.now - @station_submission.created_at)

    if @remaining_time > 0
      @remaining_time = @remaining_time
    else
      @remaining_time = 0
    end

    @station.questions.each do |q|
      q.create_answer(@station_submission)
    end
  end

  # POST /station_submissions or /station_submissions.json
  def create
    @station_submission = StationSubmission.new(station_submission_params)

    respond_to do |format|
      if @station_submission.save
        format.html { redirect_to station_submission_url(@station_submission), notice: "Station submission was successfully created." }
        format.json { render :show, status: :created, location: @station_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_submissions/1 or /station_submissions/1.json
  def update
    respond_to do |format|
      if @station_submission.update(station_submission_params)
        format.html { redirect_to station_submission_url(@station_submission), notice: "Station submission was successfully updated." }
        format.json { render :show, status: :ok, location: @station_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_submissions/1 or /station_submissions/1.json
  def destroy
    @station_submission.destroy

    respond_to do |format|
      format.html { redirect_to station_submissions_url, notice: "Station submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_submission_for_circuit
    @submission = StationSubmission.new
    @submission.station_id = params[:station_id]
    @submission.circuit_submission_id = params[:circuit_submission_id]

    respond_to do |format|
      if @submission.save
        format.html { redirect_to edit_station_submission_path(@submission), notice: "Submissão criada com sucesso" }
      end
    end
  end

  def correct
    @submission = StationSubmission.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_submission
      @station_submission = StationSubmission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_submission_params
      params.require(:station_submission).permit(:circuit_submission_id, :station_id)
    end
end
