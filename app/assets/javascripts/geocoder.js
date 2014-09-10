// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

OurCity.geocoder = {

  init: function() {
    $('#geocode-form').on('submit', this.lookupAddress);
  },

  lookupAddress: function(event) {
    event.preventDefault();
    var address = $('#geocode-form input').val();
    var jqxhr = $.post('geocoder/search', {
      address: address
    });
    jqxhr.done(function (data) {
      var member = data
      var path = window.location + 'council_members/' + data.id
      window.location = path;
    });
  }

}
