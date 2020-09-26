<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디찾기</title>

   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findId.css" />
   <script src="js/jquery/jquery-3.5.1.min.js"></script>
  
  </head>

  <body>
    
    <div class="findIdPopup">
    
      <p class="popupTitle">아이디 찾기</p>
      
      <div class="findIdLine"></div>

      <form id="enterNamePhone"
         action="<%=request.getContextPath() %>/member/findIdInfo" method="post">
         <p class="inputTitle">이름을 입력하세요</p>
         <input type="text" id="userName" name="userName" placeholder="이름 입력">

         <p class="inputTitle">전화번호를 입력하세요</p>
         <input type="text" id="userPhone" name="userPhone" placeholder="전화번호 입력">
      </form>

      <button class="next" onclick="location.replace('<%=request.getContextPath() %>/member/findIdInfo')">다음</button>
          
    </div>

  </body>
</html>


