
$(document).ready(function () {
    $(".aa").on("click", function () {
      $(".commentRegistration").addClass("active");
    });
    $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().removeClass("active");
    });
  });