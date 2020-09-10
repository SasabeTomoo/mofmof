class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy]
  def index
    @estates = Estate.all
  end
  def new
    @estate = Estate.new
    2.times { @estate.stations.build }
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
    @moyori_stations = Station.where(estate_id: @estate.id)
  end
  def edit
    @estate.stations.build
  end
  def update
    @estate.update(estate_params)
      redirect_to estates_path, notice: "編集しました"
  end
  def destroy
    @estate.destroy
    redirect_to estates_path, notice:"削除しました"
  end
end

private
def set_estate
  @estate = Estate.find(params[:id])
end
def estate_params
  params.require(:estate).permit(
          :name,
          :fee,
          :adress,
          :year,
          :memo,
          stations_attributes:[:id,
                              :route,
                              :name,
                              :time,
                              :estate_id])

end
