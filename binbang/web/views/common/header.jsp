<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header headerColor">
	<a href="<%=request.getContextPath()%>/mainMove" class="logo"></a>
	<div class="headerBtn" id="headerBtn">
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
		<div class="ham mainHamColor"></div>
	</div>
	<%@ include file="/views/common/nav.jsp"%>
</header>