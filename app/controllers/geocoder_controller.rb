class GeocoderController < ApplicationController
  respond_to :json

  def search
    address   = params[:address] + ", Minneapolis, MN"
    location  = Location.new(address: address)

    location.valid? # force the callbacks even for unsaved locations

    render json: location
  end

end
