class ApartmentsController < ApplicationController
  def index
    if params[:resort_id]
      @apartments = Resort.find(params[:resort_id]).apartments
    else
      @apartments = Apartment.all
    end
    render json: { apartments: @apartments }
  end

  def show
    render json: Apartment.find(params[:id])
  end
end