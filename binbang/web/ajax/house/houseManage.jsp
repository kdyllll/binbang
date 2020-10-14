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
	width:100%;
}

.houseImg {
	float:left;
	width: calc((100% - 60px) / 4);
	height: 350px;
	padding-bottom: 30px;
	margin-right:20px;
}

.houseImg:nth-child(4n) {
	margin-right:0;
}

.houseImg img {
	width: 100%;
	height: 300px;
	background-color:#ffeaa7;
}

 .houseImg>form {
	display: flex;
	flex-direction : column;
} 


</style>
<ul>
	<li><h2>숙소관리</h2></li>
	<li><input type="button" value="숙소등록" onclick="location.replace('<%=request.getContextPath()%>/house/houseEnroll')"></li>
</ul>
<div class="myHouseImgCon">
	<%
			for (House h : list) {
		%>
	<div class="houseImg">	
		<form class="houseAll" method="post">
			<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=h.getHouseNo() %>&totalPrice=<%=h.getPriceDay()%>">
				<img src="<%=request.getContextPath() %>/upload/house/<%=h.getHouseMainPic() %>">
			</a> 
			<input type="hidden" name="houseNo" value="<%=h.getHouseNo()%>" /> 
				<span><%=h.getHouseName().length() > 15 ? h.getHouseName().substring(0, 15) +"..." : h.getHouseName() %></span> 
			<div>
				<button class="updateH">수정</button>
				<button class="deleteH">삭제</button>
			</div>
		</form>	
	</div>
	<%
			}
		%>
		<div style="clear:both;"></div>
</div>
<script>
	$(".deleteH").on("click",e => {
		$(".houseAll").attr("action","<%=request.getContextPath()%>/host/houseDelete").submit();
	})
	$(".updateH").on("click", e => {
		$(".houseAll").attr("action","<%=request.getContextPath()%>/host/houseChangePage").submit();
	})
</script>

