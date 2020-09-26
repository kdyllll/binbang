// 자세히 보기 팝업
$(document).ready(function () {
    $(".guidanceDetails").on("click", function () {
      $(".enrollbg").addClass("active");
    });
    $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().removeClass("active");
    });
  });