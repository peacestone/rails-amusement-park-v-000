class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_attributes)
    redirect_to attraction_path(@attraction)
  end


  def create
    @attraction = Attraction.create(attraction_attributes)
    redirect_to attraction_path(@attraction)
  end

  private
    def attraction_attributes
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
