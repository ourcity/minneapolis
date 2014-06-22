class MapsController < ApplicationController
  before_action :set_map, only: :show

  def index
    @maps = Map.all
    respond_to do |format|
      format.html
      format.json { render json: @maps }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @map }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params[:map]
    end
end
