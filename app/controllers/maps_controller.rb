class MapsController < ApplicationController
  before_action :set_map, only: :show

  def index
    @maps = Map.all
  end

  def show
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
