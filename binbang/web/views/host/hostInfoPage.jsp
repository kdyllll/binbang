<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@page import="com.binbang.host.model.vo.Host"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host/hostInfoPage.css">
<% 
	Host h = (Host)request.getAttribute("host");
	List<House> list = (List)request.getAttribute("list");
%>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/header.jsp"%>
	<section class="section">
		<aside class="hostInfoCon">
			<div>
				<a href="#"><%=h.getHostName() %></a>
				<img src="<%=h.getProfilePic()%>">호스트 사진
			</div>
			<p>숙소후기</p>
			<div class="line">선</div>
			<h2><%=h.getHostName() %>님인증완료</h2>
			<div>
				<div>체크사진</div>
				<span>이메일 인증</span>
			</div>
			<div>
				<div>체크사진</div>
				<span>전화번호 인증</span>
			</div>
			<a href="#">신고하기</a>
		</aside>
		<aside class="hostHouseInfoCon">
			<div class="hostIntroduction">
				<p>안녕하세요.<%=h.getHostName() %>입니다</p>
				<textarea><%=h.getIntro() %></textarea>
			</div>
			<div class="hostHouseAllInfo">
				<%for(House ho : list) { %>
				<a class="hostHouseOne" href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=ho.getHouseNo()%>">
					<img src="#">
					<span><%=ho.getHouseNo() %></span>
					<span><%=ho.getHouseName() %></span>
				</a>
				<%} %>
				
			</div>
			
			<div class="line">선</div>
			

		</aside>

	</section>
	<%@ include file="/views/common/footer.jsp"%>
	</div>
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
</body>
</html>