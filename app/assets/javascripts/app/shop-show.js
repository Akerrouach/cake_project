$(document).ready(function() {
  $(".clickable").click(function() {
    $(".clickable").removeClass("active-sommaire")
    $(this).addClass("active-sommaire");
  });

  $(".popover-img").popover({
    html: true,
    trigger: "hover"
  });

});