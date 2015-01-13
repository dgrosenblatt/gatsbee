$(document).ready(function(){
  var height = Math.max($( ".club-page-right" ).height(), $( ".club-page-left" ).height());
  $( ".club-page-left" ).height(height);
  $( ".club-page-right" ).height(height);
});
