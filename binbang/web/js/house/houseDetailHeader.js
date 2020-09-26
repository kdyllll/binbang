/**
 * 
 */
// header 스크롤내리면 검색창이 숙소 관련 정보, 후기, 주변사진 으로 나눠서 해더 바가 바뀜
$(document).ready(function () {
    $(document).scroll(function () {
      const h1 = $(document).scrollTop();
      if (h1 > 200) {
        $(".searchBox").addClass("displayNone");
        $(".headerBox").removeClass("displayNone");


      } else {
        $(".searchBox").removeClass("displayNone");
        $(".headerBox").addClass("displayNone");

      }
    });
  });
  