<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul>
	<li><h2>숙소관리</h2></li>
	<li><input type="button" value="숙소등록" onclick="location.replace('<%=request.getContextPath()%>/house/houseEnroll')"></li>
</ul>
<div class="myHouseImgCon">
	<%
		for (int i = 1; i < 10; i++) {
	%>
	<div class="houseImg">
		<img>
		<div>
			<span>제목</span>
			<button>삭제</button>
		</div>
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
