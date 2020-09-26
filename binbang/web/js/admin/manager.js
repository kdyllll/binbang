// 각 메뉴 스타일 적용
$("#memberAll, #reserveAll, #hostAll").on({
    "click":function(e){
        let id = $(e.target).prop("id");
        if( id == "memberAll") {
            $("#reserveAll").removeClass("clickList");
            $("#hostAll").removeClass("clickList");
            $(e.target).addClass("clickList");
        } else if (id == "reserveAll" ) {
            $("#memberAll").removeClass("clickList");
            $("#hostAll").removeClass("clickList");
            $(e.target).addClass("clickList");
        } else if (id == "hostAll") {
            $("#reserveAll").removeClass("clickList");
            $("#memberAll").removeClass("clickList");
            $(e.target).addClass("clickList");
        }
    },
    "mouseover":function(e){
        $(e.target).addClass("hoverList");
    },
    "mouseleave":function(e){
        $(e.target).removeClass("hoverList")
    }
});

$("#hostList, #acceptList, #blackList").on({
    "mouseover":function(e){
        $(e.target).addClass("subList")
    },
    "mouseleave":function(e){
        $(e.target).removeClass("subList")
    }
});


function slideMenu(e){
    var clickId = $(e.target).attr('id'); 
    if(clickId == "hostAll"){
        $("#subAll").slideToggle();
    }
    
}

// div전환하기
$("#memberAll").ready(e =>{
    $("#memberAllContents").show();
    $("#reserveAllContents").hide();
    $("#hostListContents").hide();
    $("#acceptListContents").hide();
    $("#blackListContents").hide();

}),
$("#memberAll").click(e =>{
    $("#memberAllContents").show();
    $("#reserveAllContents").hide();
    $("#hostListContents").hide();
    $("#acceptListContents").hide();
    $("#blackListContents").hide();

});

$("#reserveAll").click(e=>{
    $("#memberAllContents").hide();
    $("#reserveAllContents").show();
    $("#hostListContents").hide();
    $("#acceptListContents").hide();
    $("#blackListContents").hide();
});

$("#hostList").click(e=>{
    $("#memberAllContents").hide();
    $("#reserveAllContents").hide();
    $("#hostListContents").show();
    $("#acceptListContents").hide();
    $("#blackListContents").hide();

});

$("#acceptList").click(e=>{
    $("#memberAllContents").hide();
    $("#reserveAllContents").hide();
    $("#hostListContents").hide();
    $("#acceptListContents").show();
    $("#blackListContents").hide();
});

$("#blackList").click(e=>{
    $("#memberAllContents").hide();
    $("#reserveAllContents").hide();
    $("#hostListContents").hide();
    $("#acceptListContents").hide();
    $("#blackListContents").show();

});


// 호스트 신고 관리 신고처리상황td
$("#complain, #cancel, #out").on({
    "click":function(e){
        let id = $(e.target).prop("id");
        if( id == "complain") {
            $(".complainChoice").remove().children();
            $(".complainCurrent").append($("<span>").text("신고완료"));
        } else if (id == "cancel" ) {
            $(".complainChoice").remove().children();
            $(".complainCurrent").append($("<span>").text("취소완료"));
        } else if (id == "out") {
            $(".complainChoice").remove().children();
            $(".complainCurrent").append($("<span>").text("권한박탈완료"));
        }
    }
});

//호스트 승인 여부
$("#yes, #no").on({
    "click":function(e){
        let id = $(e.target).prop("id");
        if( id == "yes") {
            $(e.target).parent().parent().parent().remove();
            alert("호스트 권한을 승인하였습니다.");
        } else if (id == "no" ) {
            $(e.target).parent().parent().parent().remove();
            alert("호스트 등록을 거절하였습니다.");
        }
    }
});


// 호스트 신고사유 테이블 말줄임표
$(".complainReason").each(function(){
    var length=7;
    $(".complainReason").each(function(){
        if($(".complainReason").text().length>=length){
        $(".complainReason").text($(".complainReason").text().substr(0,length)+"...");
        }
    });
});
$(".complainCategory").each(function(){
    var length=7;
    $(".complainCategory").each(function(){
        if($(".complainCategory").text().length>=length){
        $(".complainCategory").text($(".complainCategory").text().substr(0,length)+"...");
        }
    });
});


// 팝업 
$(document).ready(function () {
    $(".complainReason").on("click", function () {
      $(".enrollbg").addClass("active");
    });
    $(".popupBtn").on("click", function (e) {
      $(e.target).parent().parent().removeClass("active");
    });
  });