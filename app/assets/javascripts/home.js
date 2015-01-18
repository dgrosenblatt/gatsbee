$(document).ready(function(){
  $(".stories p").mouseenter(function(){
    $(this).css("margin-bottom", "25px");
    $(this).animate({
      opacity: 1,
      height: "+=25"
    }, 100, function(){
      $(this).find(".fa-arrow-circle-down").fadeIn(400);
    });
  });

  $(".stories p").mouseleave(function(){
    $(this).find(".fa-arrow-circle-down").fadeOut(100);
    $(this).animate({
      opacity: 0.85,
      height: "-=25"
    }, 100, function(){
      $(this).css("margin-bottom", "50px");
      $(this).find(".fa-arrow-circle-down").fadeOut(10);
    });
  });

  $(".stories p").change(function(){
    console.log("a change occurred")
    if ($(this).height() == 175) {

      $(this).find(".fa-arrow-circle-down").fadeOut(100);
    }
  });

  $(".stories p#discover").click(function() {
    $('html, body').animate({
      scrollTop: $("#story1").offset().top
    }, 1000);
  });

  $(".stories p#find").click(function() {
    $('html, body').animate({
      scrollTop: $("#story2").offset().top
    }, 750);
  });

  $(".stories p#engage").click(function() {
    $('html, body').animate({
      scrollTop: $("#story3").offset().top
    }, 500);
  });
});
