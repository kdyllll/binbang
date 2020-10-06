<%@page import="com.binbang.house.model.vo.Review"%>
<%@page import="com.binbang.member.model.vo.Favorite"%>
<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<House> house = (List<House>)request.getAttribute("house");
	List<Favorite> favorite=(List<Favorite>)request.getAttribute("fav");
	Member member = (Member) session.getAttribute("m");
%>

<%@ include file="/views/common/commonLink.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/searchBox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/house/houseSearchAjax.css" />
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp"%>
			<!-- 지도 -->
			<div class="map">지도</div>
			<!-- 선 -->
			<div class="line"></div>
			<!-- 숙소리스트 -->
			<div class="list">
				<%
					for (House h : house) {
				%>
				<div class="house">

					<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=h.getHouseNo()%>"
						class="housePic1"></a>
					<div class="houseContents">

						<div class="contentSection1">
							<p class="houseName"><%=h.getHouseName()%></p>
							<div class="heartCommon fav">
							<%
							for(Favorite f : favorite){
								if(f.getHouseNo().equals(h.getHostNo())){
									//이집이 관심숙소 리스트에 있는 집이면 heart %>							
							  	<script> 
							  	$(".heartCommon").removeClass(".fav"); 
							  	$(".heartCommon").addClass(".heart"); 
							  	</script>
							  	<%}
							}
							%>
							</div>
						</div>

						<div class="houseLine"></div>


						<div class="contentSection2">
							<div class="contentBox">
								<div class="iconLocation"></div>
								<p class="locationName"><%=(h.getHouseLocation()).substring(0,2)%></p> 								
							</div>

							<div class="contentLine"></div>

							<div class="contentBox">
								<div class="iconGrade"></div>
								<p class="gradeName">
								<%=h.getAvgGrade()%>/5
								</p>
							</div>
						</div>
						<div class="houseLine2"></div>
						<div class="contentSection3">
							<div class="contentBox">
								<div class="iconPrice"></div>
								<p class="priceName"><!-- 가격 : 총요금/날짜수-->
								<%
								
								%>
								</p>
							</div>

							<div class="contentLine"></div>

							<div class="contentBox">
								<div class="iconPeople"></div>
								<p class="PeopleName"><%=h.getHousePnum()%>명</p>
							</div>
						</div>

					</div>
				</div>
				<%
					}
				%>
			</div>
		<%@ include file="/views/common/footer.jsp"%>
	</div>
	
	<script src="<%=request.getContextPath()%>/js/common/header.js"></script>
	<script src="<%=request.getContextPath()%>/js/house/houseSearch.js"></script>
	<script src="<%=request.getContextPath()%>/js/common/heart.js"></script>
</body>
</html>