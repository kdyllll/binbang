<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	List<House> list = (List) request.getAttribute("list");
%>

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
<ul>
	<li><h2>숙소관리</h2></li>
	<li><input type="button" value="숙소등록"
		onclick="location.replace('<%=request.getContextPath()%>/house/houseEnroll')"></li>
</ul>
<div class="myHouseImgCon">
	<div class="houseImg">
		<%
			for (House h : list) {
		%>
		<form class="houseAll" method="post">
			<img> <input type="hidden" name="houseNo"
				value="<%=h.getHouseNo()%>" /> <span><%=h.getHouseName()%></span> <span><%=h.getHouseNo()%></span>
			<button class="updateH">수정</button>
			<button class="deleteH">삭제</button>
		</form>
		<%
			}
		%>
	</div>
</div>
<script>
	$(".deleteH").on("click",e => {
		$(".houseAll").attr("action","<%=request.getContextPath()%>/house/houseDelete").submit();
	})
</script>

