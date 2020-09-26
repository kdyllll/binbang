<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<header class="header headerColor">
		<a href="<%=request.getContextPath() %>/mainMove.do" class="logo"></a>
		<div class="searchBox"></div>
		<div class="headerBox displayNone">
			<a href="#" class="infoFilter"> 정보 </a> <a href="#"
				class="reviewFilter"> 후기 </a> <a href="#"
				class="photoFilter "> 주변시설 </a>
		</div>
		<div class="headerBtn" id="headerBtn">
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
	</div>
		<%@ include file="/views/common/nav.jsp"%>
	</header>
