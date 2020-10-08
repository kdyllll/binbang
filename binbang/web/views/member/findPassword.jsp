<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>비밀번호 찾기</title>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findPassword.css" />

     <script src="<%=request.getContextPath() %>/js/common/jquery-3.5.1.min.js"></script>
  </head>

  <body>    
    <div class="loginPopup">
      
      <p class="popupTitle">비밀번호 재설정</p>      
      <div class="passwordLine"></div>      
     
        <p class="inputTitle">아이디(이메일)를 입력하세요</p>
        <div class="input">
          <input type="text" class="setPassword" name="email" id="email" placeholder="아이디(이메일) 입력"> 
          <input type="button" value="인증하기" id="emailConfirm">
        </div>
     
     
     
        <p class="inputTitle">인증번호</p>
        
        <form id="numberForm" class="input">        	
          	<input type="text" class="setPassword" name="number" id="number" placeholder="인증번호 입력">
          	<input type="button" id="numberConfirm" value="인증확인">
        </form>
      
	
		<form>
	        <div id="resend">
	          <p id="timer"></p>
	          <input type="button" value="재전송" style="display:none;" onclick="sendNumber2();" id="reNumberConfirm">
	        </div>
	         <!-- <input type="button" value="다음" class="next"> -->
      	</form>
  
    </div>
        
    <script> 

    
    $("#emailConfirm").click(e => {
    	$.ajax({
    		url:"<%=request.getContextPath()%>/member/checkConfirmNumber",
    		type:"post",
    		data:{"email":$("#email").val()},
    		dataType:"html",
    		success:data => {
    			if($("#email").val().trim().length==0){
    				alert("아이디를 확인해주세요.");
    				return;
    			}else{
    				alert("인증번호가 발송되었습니다.");
    				sendNumber();
    			}
    			
    		},
    		error:(request,status,error)=>{
				console.log(request);
				console.log(status);
				console.log(error);
			}
    		
    	});
    	
    });
    
    $("#numberConfirm").on("click",e => {
    	$("#numberForm").attr("action","<%=request.getContextPath()%>/member/checkEmailNumber").submit();
    });
      
    
       let time=300;
       let min=0;
       let sec=0;
       let x = 0;
       /* 재전송 */
     function sendNumber2(){
    	 clearInterval(x);
        document.getElementById("timer").innerHTML="";
        time=300;
        
        sendNumber();
     }
     
      function sendNumber() {
    	
       	document.getElementById("reNumberConfirm").style.display="block";
      
        x=setInterval(function(){
          min=parseInt(time/60);
          sec=time%60;
          document.getElementById("timer").innerHTML="인증 시간 : "+min+"분"+sec+"초";
          time--;
          let test = document.getElementById("reNumberConfirm");
          
        },1000);
      };       
     

    </script>

  </body>
</html>
