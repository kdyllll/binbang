/**
 * 
 */
$(function () {
    var w = $(window);
    let footerHei = $("footer").outerHeight();
    let $banner = $(".guestRoom");

    w.on("scroll", function () {
      var sT = w.scrollTop();
      var val = $(document).height() - w.height() - footerHei;

      if (sT >= val) $banner.addClass("on");
      else $banner.removeClass("on");
    });

$(".guidanceDetails").on("click", function () {
      $(".enrollbg").addClass("active");
    });
    $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().removeClass("active");
    });

  });


