/**
 * 
 */
function check() {
	 var chkbox  = document.getElementsByName('check');
	 var chk = false;
	 for(var i=0 ; i<chkbox.length; i++) {
		 if(chkbox[i].checked) {
			 chk = true; 
		} else { 
			chk = false;
			 }
		 } 
	
	if(chk) {
		 alert("약관에 동의함."); 
	return false; 
	} else { 
		alert("약관에 동의해 주세요.") 
		} 
	}

