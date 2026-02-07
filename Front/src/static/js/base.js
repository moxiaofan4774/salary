function searchClick() {
  $("#search").toggleClass("active");
}

function searchClick2() {
  $("#search2").toggleClass("active");
}

function selectClick() {
  $("#selectList").fadeToggle(600);
}

$(function () {
  $(".left-nav").headroom({
    tolerance: 5,
    offset: 325,
  });
});

$("#navbar-menu").find("*").attr("navbar", "true");
$("#header").click(function (e) {
  if (
    e.target.id != "navbar-menu" &&
    $(e.target).attr("navbar") != "true" &&
    $("body").hasClass("side-right")
  ) {
    $("body").removeClass("side-right");
    $("#nav-button").click();
  }
});

if ($(window).width() > 992) {
  $(".main-box").scrollTop(0);
  $(".header-top").mousewheel(function (event, delta, deltaX, deltaY) {
    if (delta < 0) {
      $(".header-top").removeClass("header1");
      $(".header-scroll").removeClass("header2");
      $(".main-box").removeClass("scroll");
      setTimeout(function () {
        $(".header-top").addClass("header1");
        $(".main-box").addClass("scroll");
        $(".header-scroll").addClass("header2");
      }, 100);
    }
  });
  $(".main-box").mousewheel(function (event, delta, deltaX, deltaY) {
    if (delta > 0 && $(".main-box").scrollTop() == 0) {
      $(".header-top").removeClass("header1");
      $(".header-scroll").removeClass("header2");
      $(".main-box").removeClass("scroll");
    }
  });
}

$(".main-box ").scroll(function () {
  $(".c1,.c2,.row3,.row4,.zttj-list,.t1,.t2,.t3").each(function (index, element) {
    var e = $(this);
    var fix = parseInt(e.attr("fix"));
    if (!fix && fix != 0) {
      fix = $(window).height() * 6 * 0.1;
    } else {
      fix = $(window).height() * fix * 0.1;
    }
    if ($(window).scrollTop() >= $(e).offset().top - fix) {
      if (!$(e).hasClass("showdiv")) {
        $(e).addClass("showdiv");
      }
    } else {
      if ($(e).hasClass("showdiv")) {
        $(e).removeClass("showdiv");
      }
    }
  });
});
