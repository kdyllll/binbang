<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="header headerColor">
	<a href="#" class="logo"></a>
	<a href="<%=request.getContextPath() %>/mainMove" class="bookingPage">booking</a>
	<div class="headerBtn" id="headerBtn">
		<div id="ham"></div>
		<div id="ham"></div>
		<div id="ham"></div>
	</div>
	<%@ include file="/views/common/nav.jsp" %>
</header>