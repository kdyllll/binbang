//관심숙소 버튼 누르면 이미지 변경
$(".heartCommon").on("click",function(e){
    $(e.target).toggleClass("heart");
    $(e.target).toggleClass("fav");
});