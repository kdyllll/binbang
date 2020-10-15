/**
 * 
 */
// 정렬구역
//버튼 누르면 밑에 항목들 나옴
$(".btnText").on("click", function (e) {
    // console.log($(e.target).parent().children("ul"))
    $(e.target).parent().next("ul").toggleClass("box");
});

//정렬에서 선택하면 부모칸에 선택한 항목 이름 나옴
$("#houseSort > li").on("click", function (e) {
let a = $(e.target).html();
$(".pSort").html(a);
$(e.target).parent().addClass("box");
});

//요금,필터에서 버튼 누르면 창 닫힘
$(".selectBtn").on("click", function(e){
$(e.target).parent().parent().toggleClass("box");
});

