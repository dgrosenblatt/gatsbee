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
      $(this).find(".fa-arrow-circle-down").fadeOut(1);
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

  $("#inputtime1").hover(
    function() {
      $(this).css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
      $("#parsetime1").css("opacity","1");
    },
    function(){
      $(this).css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"});
      $("#parsetime1").css("opacity", "0.5");
    }
  );
  $("#inputtime2").hover(
    function() {
      $(this).css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
      $("#parsetime2").css("opacity", "1");
    },
    function(){
      $(this).css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"});
      $("#parsetime2").css("opacity", "0.5");
    }
  );
  $("#inputtime3").hover(
    function() {
      $(this).css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
      $("#parsetime3").css("opacity", "1");
    },
    function(){
      $(this).css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"});
      $("#parsetime3").css("opacity", "0.5");
    }
  );
  $("#parsetime1").hover(
    function() {
      $(this).css("opacity", "1")
      $("#inputtime1").css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
    },
    function(){
      $(this).css("opacity", "0.5")
      $("#inputtime1").css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"})
    }
  );
  $("#parsetime2").hover(
    function() {
      $(this).css("opacity", "1")
      $("#inputtime2").css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
    },
    function(){
      $(this).css("opacity", "0.5")
      $("#inputtime2").css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"})
    }
  );
  $("#parsetime3").hover(
    function() {
      $(this).css("opacity", "1")
      $("#inputtime3").css({"background-color":"#030D4F", "color":"#FFF", "opacity":"1"});
    },
    function(){
      $(this).css("opacity", "0.5")
      $("#inputtime3").css({"background-color":"#E7EDEA", "color": "#000", "opacity":"0.7"})
    }
  );
});
