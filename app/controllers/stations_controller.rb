class StationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_station, only: %i[ show edit update destroy ]

  # GET /stations or /stations.json
  def index
    @term = params[:term] != nil ? params[:term] : ""
    @stations = Station.where(user: current_user).where("title LIKE ?", "%#{@term}%")
  end

  # GET /stations/1 or /stations/1.json
  def show
  end

  # GET /stations/new
  def new
    @station = Station.new(difficulty: 3, time: 15, feedback: 1)
    @station.user = current_user

    respond_to do |format|
      if @station.save
        format.html { redirect_to edit_station_path(@station), notice: "Station was successfully created." }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations or /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to station_url(@station), notice: "Station was successfully created." }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1 or /stations/1.json
  def update
    respond_to do |format|
      @attachments = params[:station][:attachments]
      @station.attachments.attach(@attachments)
      puts "\n\n-->#{@attachments}\n>#{params[:station][:title]}<\n#{params}\n\n"

      if @station.update(station_params.except(:attachments))
        format.turbo_stream do
          flash.now[:notice] = "Salvo!"
        end
        format.html { redirect_to station_url(@station), notice: "Station was successfully updated." }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1 or /stations/1.json
  def destroy
    @station.destroy

    respond_to do |format|
      format.html { redirect_to stations_url, notice: "Station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_station_difficulty
    @station = Station.find(params[:id])
    @value = params[:value]

    @station.difficulty = @value
    @station.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  def new_question
    @station = Station.find(params[:station_id])
    @question = Question.new
    @question.station_id = params[:station_id]
    @question.kind = 1
    @question.score = 10

    respond_to do |format|
      if @question.save
        format.turbo_stream
      end
    end
  end

  def remove_question
    @station = Station.find(params[:station_id])
    @question = @station.questions.find(params[:question_id])
    
    @question.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  def remove_attachment
    @b = ActiveStorage::Blob.find_signed(params[:attachment_id])
    @b.purge

    respond_to do |f|
      f.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def station_params
      params.require(:station).permit(:title, :context, :procedure, :evaluation, :time, :difficulty, :feedback, attachments: [])
    end
end
