<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.binbang.member.model.vo.Member"%>
<%
	Member m = (Member) session.getAttribute("m");
%>


<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/mypage.css" />

</head>
<body>
	<div class="wrap">

		<!-- 2. 총 보유쿠폰 -->
		<div class="coupon">
			<div class="couponSum">
				<div class="couponContents">
					현재보유쿠폰 :
					<%=m.getCoupon()%>
					개
				</div>
			</div>

			<!-- 구분선 -->
			<!-- 쿠폰사용/생성시 마다 추가되는 로직 -->
			<div class="couponCount">
				<div class="line6"></div>
				<ul>
					<li class="addDate">2020-09-05</li>
					<li class="addContent">이나주니 집사용</li>
					<li class="addCoupon">1박쿠폰 -</li>
				</ul>
				<div class="line7"></div>
			</div>
		</div>



	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>