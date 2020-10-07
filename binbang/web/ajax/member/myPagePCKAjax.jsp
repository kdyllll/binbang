<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.binbang.member.model.vo.Member" %>	


	
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/member/mypage.css" />
</head>


<body>
	<div class="wrap">
					
		<form  action="<%=request.getContextPath() %>/member/mypagePrivate" method="post" id="memberCheck">		
			<div class="passwordCheck">
				<div class="container">
					<p class="passTitle">비밀번호 확인</p>
					<div class="passLine">							
						<input type="password" placeholder="비밀번호 입력" id="passInput" name="password"> 						
						<button class="checkBtn" id="checkBtn">확인</button>												
					</div>
				</div>
			</div>				
		</form>
		
	</div>

	<script src="<%=request.getContextPath() %>/js/common/header.js"></script>
	
	<script>

		//비밀번호 확인후 개인정보수정 페이지로 이동			
		
	</script>
		
</body>
</html>