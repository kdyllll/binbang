<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>main</title>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/changePassword.css" />
    <script src="js/jquery/jquery-3.5.1.min.js"></script>
  </head>

  <body>
   
    <div class="loginContainer">
    
      <p class="passwordTitle">비밀번호 재설정</p>
      
      <div class="passwordLine"></div>

      <form id="newPassword">
        <p class="inputTitle">새로운 비밀번호를 입력하세요</p>
        <input type="password" id="newPw" name="newPw" placeholder="비밀번호 입력"> 
      </form>
        
      <form id="newPassword_">
        <p class="inputTitle">새로운 비밀번호를 다시 입력하세요</p>
        <input type="password" id="newPw_" name="newPw_" placeholder="비밀번호 입력">
      </form>   
        
      <div id="tt"></div>
        
      <button class="next" onclick="alertPassword(); self.close();">완료</button>
          
    </div>
        
    <script> 
      function alertPassword() {
        alert("비밀번호 변경이 완료되었습니다.");
      };
      
    </script>
  

  </body>
</html>


    