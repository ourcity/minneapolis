class GeocoderController < ApplicationController
  respond_to :json

  def search
    address   = params[:address] + ", Minneapolis, MN"
    latlng    = params[:latlng]
    if address
      location  = Location.new(address: address)
      location.valid? # force the callbacks even for unsaved locations
    elsif latlng
      location  = Location.new(latitude: latlng.lat, longitude: latlng.lng)
    end
    ward = location.find_ward

    render json: CouncilMember.find_by_ward(ward)
  end

end
