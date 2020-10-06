<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
   <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/mypage.css" />
 	  
  </head>
  <body>
    <div class="wrap">
            <div class="passwordCheck">
				<div class="container">					 
					<p class="passTitle">비밀번호 확인</p>																
					<div class="passLine"> 						
						<input type="password" placeholder="비밀번호 입력" id="passInput" name="passInput">
						<input type="button" value="확인" class="checkBtn" id="checkBtn">
					</div>					
				</div>
			</div>
								
    </div>
    
    
    <script src="<%=request.getContextPath() %>/js/common/header.js"></script>
  </body>
</html>