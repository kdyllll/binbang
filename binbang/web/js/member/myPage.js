// div전환
$("#changeCoupon").ready(e =>{
    $(".house").show();
    $(".coupon").hide();
    $(".private").hide();
	$(".passwordCheck").hide();
});
$("#changeCoupon").click(e =>{
    $(".coupon").show();
    $(".house").hide();
    $(".private").hide();
	$(".passwordCheck").hide();
});
$("#changeStayed").click(e =>{
    $(".house").show();
    $(".coupon").hide();
    $(".private").hide();
	$(".passwordCheck").hide();
});

$("#changeModify").click(e =>{
    $(".private").hide();
    $(".coupon").hide();
    $(".house").hide();
	$(".passwordCheck").show();
});




// 경고창
$("#btn1").click(e =>{
alert("정말 탈퇴하시겠습니까?")
})
$("#btn2").click(e =>{
alert("정말 수정하시겠습니까?")
})