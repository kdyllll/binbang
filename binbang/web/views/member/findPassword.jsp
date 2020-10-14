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
          <input type="button" value="인증하기" class="sendEmail">
        </div>
     
     
     
        <p class="inputTitle">인증번호</p>
        
        <form id="numberForm" class="input">        	
          	<input type="text" class="setPassword" name="number" id="number" placeholder="인증번호 입력">
          	<input type="button" id="numberConfirm" value="인증확인">
        </form>
      
	
		<form>
	        <div id="resend">
	          <p id="timer"></p>
	          <input type="button" value="재전송" style="display:none;" onclick="sendNumber2();" class="sendEmail" id="reNumberConfirm">
	        </div>
	         <!-- <input type="button" value="다음" class="next"> -->
      	</form>
  
    </div>
        
    <script> 

    //인증하기 버튼 누르면 메일 전송
    $(".sendEmail").click(e => {
    	$.ajax({
    		url:"<%=request.getContextPath()%>/member/checkConfirmNumber",
    		type:"post",
    		data:{"email":$("#email").val().trim()},
    		dataType:"json",
    		success:data => {
    			console.log(data);
    			alert(data["msg"]);
    			if(data["result"]=='1'){
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
    
    //인증번호 일치여부 확인
    
    $("#numberConfirm").click(e => {
    	$.ajax({
    		url:"<%=request.getContextPath()%>/member/checkEmailNumber",
    		type:"post",
    		data:{"number":$("#number").val().trim()},
    		dataType:"json",
    		success:data => {
    			console.log(data);
    			alert(data["msg"]);
    			if(data["result"]=='1'){
    				location.href='<%=request.getContextPath()%>/member/memberChangePassword';
    			} 
    			
    		},
    		error:(request,status,error)=>{
				console.log(request);
				console.log(status);
				console.log(error);
			}
    		
    	});
    	
    });
    
       let time=300;
       let min=0;
       let sec=0;
       let x = 0;
     //재전송
     function sendNumber2(){
    	   
    	clearInterval(x); 
        time=300; 
        sendNumber();
     }
     
      function sendNumber() {
    	clearInterval(x);
       	document.getElementById("reNumberConfirm").style.display="block";
      
        x=setInterval(function(){
        	
          min=parseInt(time/60);
          sec=time%60;
          document.getElementById("timer").innerHTML="인증 시간 : "+min+"분"+sec+"초";
          time--;
          
			if(time<0){
	          clearInterval(x);
	          document.getElementById("timer").innerHTML="다시 인증해주세요.";
	        }
			
        },1000);
        
       
      };       
     

    </script>

  </body>
</html>
