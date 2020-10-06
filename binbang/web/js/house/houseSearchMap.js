
//지도 움직임
$(function () {
    var w = $(window);
    let footerHei = $(".footer").outerHeight();
    let banner = $(".map");

    w.on("scroll", function () {
      var sT = w.scrollTop();
      var val = $(document).height() - w.height() - footerHei;

      if (sT >= val) banner.addClass("on");
      else banner.removeClass("on");
    });
  });