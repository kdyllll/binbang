$(".pay").on("click",e => {

	  if ($("input:checkbox[name='check']:checked").val()) {// 제이쿼리에서는 발, 자바에서는 벨류값임 
			
		}else{
		    alert("개인정보취급방침의 내용에 동의하시기 바랍니다.");
			return false;
		}
}); 
$(".pay").on("click",e => {

	  if ($("input:radio[id='bankTransfer']:checked").val()) {	
		}
	  // 무통장입음으로 체크하고 booking 눌렀을때 이메일로 인증번호를 로직을 구성
}); 


 




