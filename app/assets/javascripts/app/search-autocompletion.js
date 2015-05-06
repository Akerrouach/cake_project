google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('search_input_autocomplete_location');
});

function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

// JS DatePicker
 $.fn.datepicker.defaults.format = 'dd/mm/yyyy';
 $.fn.datepicker.defaults.language = 'fr';