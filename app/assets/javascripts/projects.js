$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

   $.getScript('/projects?search=' + searchValue);
  });

  $('#search').on("input", function(){
    var field = $(this)
    $.get("?search="+field.val()+"&autocomplete=true", function(data){
      $("#autocomplete").html(data)
    });
    // $("#autocomplete").text(field.val())
  });
});