class CircuitApplicationsController < ApplicationController
  before_action :set_circuit_application, only: %i[ show edit update destroy ]

  # GET /circuit_applications or /circuit_applications.json
  def index
    @circuit = Circuit.find(params[:circuit_id])
    @circuit_applications = CircuitApplication.where(circuit: @circuit)
  end

  # GET /circuit_applications/1 or /circuit_applications/1.json
  def show
  end

  # GET /circuit_applications/new
  def new
    @circuit_application = CircuitApplication.new
  end

  # GET /circuit_applications/1/edit
  def edit
  end

  # POST /circuit_applications or /circuit_applications.json
  def create
    @circuit_application = CircuitApplication.new(circuit_application_params)

    respond_to do |format|
      if @circuit_application.save
        format.html { redirect_to circuit_application_url(@circuit_application), notice: "Circuit application was successfully created." }
        format.json { render :show, status: :created, location: @circuit_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @circuit_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /circuit_applications/1 or /circuit_applications/1.json
  def update
    respond_to do |format|
      if @circuit_application.update(circuit_application_params)
        format.html { redirect_to circuit_application_url(@circuit_application), notice: "Circuit application was successfully updated." }
        format.json { render :show, status: :ok, location: @circuit_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @circuit_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /circuit_applications/1 or /circuit_applications/1.json
  def destroy
    @circuit_application.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to circuit_applications_url, notice: "Circuit application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_application
    @application = CircuitApplication.new(circuit_application_params)
    @circuit = Circuit.find(params[:circuit_id])
    @application.circuit = @circuit

    respond_to do |format|
      if @application.save!
        format.turbo_stream
      end
    end
  end

  def view_submissions
    @circuit_application = CircuitApplication.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circuit_application
      @circuit_application = CircuitApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def circuit_application_params
      params.require(:circuit_application).permit(:circuit_id, :description, :link)
    end
end
