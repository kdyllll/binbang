<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		List<House> list = (List)request.getAttribute("list");
	%>
<ul>
	<li><h2>숙소관리</h2></li>
	<li><input type="button" value="숙소등록" onclick="location.replace('<%=request.getContextPath()%>/house/houseEnroll')"></li>
</ul>
<div class="myHouseImgCon">
	<%
		for (House h : list) {
	%>
	<div class="houseImg">
		<img>
		<form>
			<input type="hidden" name="houseNo" value="<%=h.getHouseNo()%>">
			<span><%=h.getHouseName() %></span>
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</form>
	</div>
	<%
		}
	%>
</div>
<style>
.myHouse>ul {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.myHouseImgCon {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.houseImg {
	width: 250px;
	height: 350px;
	padding-bottom: 30px;
}

.houseImg>img {
	width: 100%;
	height: 90%;
	border: 1px solid;
}

.houseImg>div {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
