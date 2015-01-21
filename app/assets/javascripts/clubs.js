$(window).load(function(){
  var height = Math.max($(".club-page-right").height(), $(".club-page-left").height());
  $(".club-page-left").height(height);
  $(".club-page-right").height(height);

  $("#club-discussion").click(function(){
    $(".new_comment").slideToggle();
  });

  $("#meeting-time-info").click(function(){
    $("#meeting-instructions").slideToggle();
  });

  $("#meeting-instructions p").click(function(){
    $("#meeting_meeting_time").val($(this).text());
  });

  $("#club-meetings").click(function(){
    $("#meetings-form").slideToggle();
  });
});
