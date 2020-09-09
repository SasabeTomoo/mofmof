class EstatesController < ApplicationController
  def index
    @estates = Estate.all
  end
  def new
    @estate = Estate.new
    @estate.build_station
  end
  def create
    @estate = Estate.new(estate_params)
    if @estate.save
      redirect_to estates_path
    else
      render :new
    end
  end
  def show
  end
  def edit
    @estate = Estate.find(params[:id])
  end
  def update
  end
  def destroy
  end

  private
    def estate_params
      params.require(:estate).permit(
              :name,
              :fee,
              :adress,
              :year,
              :memo,
              station_attributes:[:id,
                                  :route,
                                  :name,
                                  :time,
                                  :estate_id])
    end
end
