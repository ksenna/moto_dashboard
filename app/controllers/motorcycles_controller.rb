class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)

    respond_to do |format|
      if @motorcycle.save
        format.html { redirect_to @motorcycle, notice: 'Moto was successfully created.' }
        format.json { render :show, status: :created, location: @motorcycle }
      else
        format.html { render :new }
        format.json { render json: @motorcycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Motorcycle.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to motorcycles_url, notice: 'Moto was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:name, :description)
  end
end
