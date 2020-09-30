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
      
      <form id="emailForm">
        <p class="inputTitle">아이디(이메일)를 입력하세요</p>
        <div class="input">
          <input type="text" class="setPassword" name="userId" placeholder="아이디(이메일) 입력"> 
          <input type="button" value="인증하기" id="emailConfirm" onclick="sendNumber();">
        </div>
      </form>
       
      <form id="numberForm">
        <p class="inputTitle">인증번호</p>
        <div class="input">
          <input type="password" class="setPassword" name="number" placeholder="인증번호 입력">
          <button id="numberConfirm" onclick="start_timer();">인증확인</button>
        </div>

        <div id="resend">
          <p id="timer"></p>
          <input type="button" value="재전송" style="display:none;" onclick="sendNumber2();" id="reNumberConfirm">
        </div>
      </form>
      
        <!-- 완료면 인증완료되었습니다 알림
        실패면 인증번호를 다시 입력해주세요 알림
        재전송 버튼 -->
        <!-- <p class="successConfirm">인증 완료 되었습니다.</p> -->
      <button class="next" onclick="location.replace('<%=request.getContextPath() %>/member/changePassword')">다음</button>
          
    </div>
        
    <script> 
       let time=300;
       let min=0;
       let sec=0;
       let x = 0;
       
     function sendNumber2(){
        clearInterval(x);
        document.getElementById("timer").innerHTML="";
        time=300;
        
        sendNumber();
     }
      function sendNumber() {
       document.getElementById("reNumberConfirm").style.display="block";
        alert("인증번호가 발송되었습니다.");
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
