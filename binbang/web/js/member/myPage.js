// div전환
$("#changeCoupon").ready(e =>{
    $(".house").show();
    $(".coupon").hide();
    $(".private").hide();
});
$("#changeCoupon").click(e =>{
    $(".coupon").show();
    $(".house").hide();
    $(".private").hide();
});
$("#changeStayed").click(e =>{
    $(".house").show();
    $(".coupon").hide();
    $(".private").hide();
});
$("#changeModify").click(e =>{
    $(".private").show();
    $(".coupon").hide();
    $(".house").hide();
});

// 경고창
$("#btn1").click(e =>{
alert("정말 탈퇴하시겠습니까?")
})
$("#btn2").click(e =>{
alert("정말 수정하시겠습니까?")
})