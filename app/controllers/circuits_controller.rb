class CircuitsController < ApplicationController
    def index
        @circuits = Circuit.all
    end

    def new
        @circuit = Circuit.new
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

    def search
        @circuits = Circuit.where("title LIKE ?", "%" + params[:term] + "%")

        # @circuits = Circuit.where(title: 'Rails')
        

        respond_to do |format|
            format.turbo_stream
        end
    end

    private

    def circuit_params
        params.require(:circuit).permit(:title, :resume)
    end
end
