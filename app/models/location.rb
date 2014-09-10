class Location < ActiveRecord::Base
  include Geocodable

  belongs_to        :user
  before_validation :geocode
  after_validation  :setLonLat

  geocoded_by       :address do |obj, result|
    obj.latitude  = result[0].latitude
    obj.longitude = result[0].longitude
    obj.data      = result[0].data
  end

  private

  # PostGIS goodness, but useful to leaflet even without PostGIS
  def setLonLat
    # keep in mind that this format is longitude, latitude, not the other way
    self.lonlat = "POINT(#{longitude} #{latitude})"
  end
end
