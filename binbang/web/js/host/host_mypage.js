$(document).ready(function() {
	$("#changeInfo").on("click", function(e) {
		let condition = $(e.target).val();
		if (condition == "수정") {
			$(e.target).val("완료");
			$("#hostNameChn").focus();
		} else if (condition == "완료") {
			$(e.target).val("수정");
		}
	});

	$(".houseRequest > li").on("click", function(e) {
		$(".houseRequest > li").removeClass("borderTop");
		$(e.target).addClass("borderTop");
		let target = $(e.target).html();
		let myHouse = $(".myHouse");
		let houseReq = $(".houseReq");
		let houseReqCon = $(".houseReqConditon");
		console.log(target);
		myHouse.addClass("disnone");
		houseReq.addClass("disnone");
		houseReqCon.addClass("disnone");
		if (target == "숙소관리") {
			myHouse.removeClass("disnone");
		} else if (target == "숙소요청") {
			houseReq.removeClass("disnone");
		} else {
			houseReqCon.removeClass("disnone");
		}
	});
});

// 정보 넘기기 막기.
function invalidate() {
	if ($("#changeInfo").val() == "수정")
		return false;
	else
		return true;
}
