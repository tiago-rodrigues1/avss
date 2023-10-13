class CircuitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_circuit, only: %i[ show edit update destroy ]

  def index
    @term = params[:term] != nil ? params[:term] : ""
    @circuits = Circuit.where(user: current_user).where("title LIKE ?", "%#{@term}%")
  end

  def add_stations_index
    @circuit = Circuit.find(params[:id])

    @term = params[:term] != nil ? params[:term] : ""
    @stations = Station.where(user: current_user).where("title LIKE ?", "%#{@term}%")
  end

  def add_station
    @rel = CircuitStation.new
    @rel.station_id = params[:station_id]
    @rel.circuit_id = params[:id]
    @station = Station.find(params[:station_id])
    @circuit = Circuit.find(params[:id])

    respond_to do |format|
      if @rel.save
        format.turbo_stream
      end
    end
  end

  def remove_station
    @rel = CircuitStation.where(station: params[:station_id], circuit: params[:id])
    @station = Station.find(params[:station_id])
    @circuit = Circuit.find(params[:id])

    @rel.each do |r|
      r.destroy
    end

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  def new
    @circuit = Circuit.new()
    @circuit.user = current_user

    respond_to do |format|
      if @circuit.save
        format.html { redirect_to edit_circuit_path(@circuit) }
        format.json { render :show, status: :created, location: @circuit }
      else
        format.html { redirect_to dashboard_path }
        format.json { render json: @circuit.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def create
    @circuit = Circuit.new(circuit_params)

    respond_to do |format|
      if @circuit.save
        format.html { redirect_to circuits_path() }
        format.json { render :show, status: :created, location: @circuit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @circuit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @circuit.update(circuit_params)
        format.turbo_stream do
         flash.now[:notice] = "Salvo!"
        end
      end
    end
  end

  def search
    @circuits = Circuit.where("title LIKE ?", "%" + params[:term] + "%")

    # @circuits = Circuit.where(title: 'Rails')
    

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @circuit = Circuit.find(params[:id])
    @circuit.destroy

    respond_to do |format|
    format.html { redirect_to circuits_url }
    end
  end

  private
    def circuit_params
      params.require(:circuit).permit(:title, :resume)
    end

    def set_circuit
      @circuit = Circuit.find(params[:id])
    end
end
