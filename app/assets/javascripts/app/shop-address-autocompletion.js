google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('shop_input_autocomplete_address');
});

function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}