class EstatesController < ApplicationController
  def index
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
