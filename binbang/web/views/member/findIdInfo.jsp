<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디 알려주는 창</title>
  
     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/findIdInfo.css" />

    <script src="js/jquery/jquery-3.5.1.min.js"></script>
  </head>

  <body>
    
    <div class="findIdPopup">
    
      <p class="popupTitle">아이디 찾기</p>
      
      <div class="findIdLine"></div>

      <p class="resultId">tnrud26**@na******</p>
      
      <button class="finishFindId" onclick="self.close()">확인</button>
    </div>
        

  </body>
</html>