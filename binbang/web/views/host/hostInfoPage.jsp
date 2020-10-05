<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host/hostInfoPage.css">
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/header.jsp"%>
	<section class="section">
		<aside class="hostInfoCon">
			<div>
				<a href="#">호스트이름</a>
				<img>호스트 사진
			</div>
			<p>숙소후기</p>
			<div>선</div>
			<h2>이름님인증완료</h2>
			<div>
				<div>체크사진</div>
				<span>이메일 인증</span>
			</div>
			<div>
				<div>체크사진</div>
				<span>전화번호 인증</span>
			</div>
			<a>신고하기</a>
		</aside>
		<aside class="hostHouseInfoCon">


		</aside>

	</section>
	<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>