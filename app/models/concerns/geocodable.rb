module Geocodable
  extend ActiveSupport::Concern

  included do
    def find_ward
      query     = "query?geometry=#{coords}&#{ESRI_OPTIONS}"
      response  = feature_server.get(FEATURE_URL + query)
      json      = JSON.parse(response.body)
      ward = json["features"][0]["attributes"]["BDNUM"]

      ward
    end
  end

  private

  FEATURE_URL   =
    'http://services.arcgis.com/afSMGVsC7QlRK1kZ/arcgis/rest/services/WARDS/FeatureServer/0/'
  ESRI_OPTIONS  =
    'geometryType=esriGeometryPoint&inSR=4326&spatialRel=esriSpatialRelIntersects&outFields=*&returnGeometry=false&f=json'

  def coords
    "#{self.longitude},#{self.latitude}"
  end

  def feature_server
    Faraday.new(url: FEATURE_URL)
  end

end
