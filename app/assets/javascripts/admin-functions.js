$(document).ready(function() {
  $('.old_input_label').click(function() {
    var related_input = $(this).parent().children(".old_input");
    if (related_input.css('display') == 'none') {
      related_input.show("slow");
      $(this).children("span").html('hide');
    } else {
      related_input.hide("slow");
      $(this).children("span").html('show');
    }
  });
});