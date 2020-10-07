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

		<!-- 2. 총 포인트 -->
		<div class="point">
			<div>
				<div class="pointContents">
					POINT : <%=m.getPoint()%>					
				</div>
			</div>

			<!-- 구분선 -->
			<!-- 포인트사용/추가시 마다 추가되는 로직 -->
			<div class="pointCount">
				<div class="line6"></div>
				<ul>
					<li class="addDate">2020-09-05</li>
					<li class="addContent">이나주니 집사용</li>
					<li class="addpoint">100,000,000 point 사용</li>
				</ul>
				<div class="line7"></div>
			</div>
		</div>



	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>