// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

OurCity.map = {

  init: function(id){
    var that  = this,
    url   = window.location.host + '/maps/' + id;

    $.getJSON(window.location.origin + '/maps/' + id, function(data){
      that.build(data);
    });
  },

  build: function(data) {
    var store   = data.store,
    layers  = store.layers;

    map = L.map('map').setView(store.center, store.zoom);
    if (layers) {
      this.discernLayers(layers);
    }
  },

  discernLayers: function(layers) {
    for (var i = 0; i < layers.length; i++) {
      var layer = layers[i];
      if (layer.esri) {
        this.addEsriLayer(layer);
      }
      if (layer.tile) {
        this.addTileLayer(layer);
      }
      if (layer.feature) {
        this.addFeatureLayer(layer);
      }
    }
  },

  addTileLayer: function(layer) {
    L.tileLayer(layer.source, layer.params).addTo(map);
  },

  addEsriLayer: function(layer) {
    if (layer.base) {
      if (layer.labels || layer.retina) {
        L.esri.basemapLayer(layer.labels).addTo(map);
        L.esri.basemapLayer(layer.source, {
          detectRetina: true
        }).addTo(map);
      } else {
        // don't use retina maps without non-retina labels. it hurts.
        L.esri.basemapLayer(layer.source).addTo(map);
      }
    }
  },

  addFeatureLayer: function(layer) {
    console.log('addFeatureLayer', layer);
    L.esri.featureLayer(layer.source).addTo(map);
  }
};
