$ ->
  $("#contributors .user").click ->
    $("#contributors li ul").hide()
    $(this).siblings("ul").show('slow')