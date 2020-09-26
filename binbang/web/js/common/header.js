// header 햄버거 버튼 클릭
$(".headerBtn>div").addClass("mainHamColor");
$("#headerBtn").on("click", function () {
  $("#nav").toggleClass("show");
  $(".ham:nth-child(1)").toggleClass("tranRotateOne");
  $(".ham:nth-child(3)").toggleClass("tranRotateTwo");
  const h1 = $(document).scrollTop();
  if(h1==0) {
	  $(".headerBtn>div").toggleClass("mainHamColor");
  }
});

// header 스크롤내리면 배경 바뀌게
$(document).ready(function () {
  $(document).scroll(function () {
    const h = $(document).scrollTop();
    if (0 != h) {
      $(".header").addClass("bgColor");
      $(".headerBtn>div").removeClass("mainHamColor");
    } else {
      $(".header").removeClass("bgColor");
      $(".headerBtn>div").addClass("mainHamColor");
    }
  });
});
