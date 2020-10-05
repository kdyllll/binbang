
$(document).ready(function () {
    $(".ex").on("click", function () {
      $(".enrollbg").removeClass("active");
	
    });
   $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().addClass("active");
    });
  });