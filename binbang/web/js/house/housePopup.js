
$(document).ready(function () {
    $(".ex").on("click", function () {
      $(".enrollbg").addClass("active");
    });
    $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().removeClass("active");
    });
  });