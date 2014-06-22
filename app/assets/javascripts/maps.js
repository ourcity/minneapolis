// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

OurCity.map = {

  init: function(id){
    var that  = this,
        url   = window.location.host + '/maps/' + id;

    $.getJSON(window.location.origin + '/maps/' + id, function(data){
      that.show(data);
    });
  },

  show: function(data) {
    var store   = data.store,
        layers  = store.layers;

    map = L.map('map').setView(store.center, store.zoom);
    for (var i = 0; i < layers.length; i++) {
      var layer = layers[i];
      L.tileLayer(layer.source, layer.params).addTo(map);
    }
  }
};
