<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/memberEnrollChoice.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp" %>

		<section class="section">
			<h2 class="enrollCategory">회원가입 방식을 선택해주세요</h2>

			<div class="joinCategory">
				<div>
					<a href="<%=request.getContextPath()%>/member/memberEnroll"><img src="<%=request.getContextPath()%>/image/member/login/email.png">Email 회원가입</a>
					<a href="#"><img src="<%=request.getContextPath()%>/image/member/login/google.png">Google 회원가입</a>
					<a href="#"><img src="<%=request.getContextPath()%>/image/member/login/naver.png">Naver 회원가입</a>
					<a href="#"><img src="<%=request.getContextPath()%>/image/member/login/kakao.jpg">Kakao 회원가입</a>
				</div>
			</div>
		</section>
		<%@ include file="/views/common/footer.jsp" %>
	</div>
	<script src="<%=request.getContextPath() %>/js/common/header.js"></script>
	<script src="<%=request.getContextPath() %>/js/membership.js"></script>
</body>
</html>