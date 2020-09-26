/**
 * 
 */
// 약관전체동의
var checkAll = 'false';

function selectAll() {
	let items = document.getElementsByName("chk");

	if (checkAll == 'false') {
		for (let i = 0; i < items.length; i++) {
			items[i].checked = true;
		}
		checkAll = "true";
	} else {
		for (let i = 0; i < items.length; i++) {
			items[i].checked = false;
		}
		checkAll = "false";
	}
}

// 약관동의 자세히보기
$("#extendBtn1").click(function() {
	$(this).next().slideToggle(500);
})

$("#extendBtn2").click(function() {
	$(this).next().slideToggle(500);
})

$("#extendBtn3").click(function() {
	$(this).next().slideToggle(500);
})