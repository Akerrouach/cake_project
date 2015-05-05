$( document ).ready(function() {
  if ($(this).scrollTop() > 0) {
    $('#high_voltage_pages_show .navbar-wagon').removeClass('transparent')
  }
  else {
    $("#high_voltage_pages_show .navbar-wagon").addClass('transparent')
  }
  // navbar transition jQuery script
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 0) {
      $('#high_voltage_pages_show .navbar-wagon').removeClass('transparent')
    }
    else {
      $("#high_voltage_pages_show .navbar-wagon").addClass('transparent')
    }
  });

});