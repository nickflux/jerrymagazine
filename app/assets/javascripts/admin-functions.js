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

function add_fields(link, association, content) {
  // Generate new unique index, so base this off the current time.
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  // Replace new_association with the current time.
  $("#work_pages .work_page_fields:last").after(content.replace(regexp, new_id));
}
