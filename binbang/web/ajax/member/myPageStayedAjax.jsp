<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.binbang.booking.model.vo.Booking"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	List<Booking> list = (List) request.getAttribute("list");
%>

<style>
	.section {
		padding: 6% 20%;			
	}
	.reservedTitle {	
		font-weight:600;
		font-size:15px;
	}	
	.house {
		padding: 6% 2%;
		display:flex;
		margin-bottom:50px;
	}	
	.house > .myReserve,
	.house > .myReserved,
	.house > .myCancel {
		position:relative;
		width:250px;
		height:300px;
	}
	#houseResv{
		font-size: 14px;
		padding: 10px;		
	}
	.reservCancel{
		display: flex;
		float:right;
		font-size: 14px;
		width:50px;
		height:20px;
		outline:none;
		cursor:pointer;
		border:none;
		background-color: rgba(255, 255, 255, 0.836);
	}
	#houseContent{		
		width:300px;
		background-color: rgba(255, 255, 255, 0.836);
		position: absolute;
	  	bottom: 25px;
	  	left: 0;
	}
	
</style>

<!-- 숙소 -->
<!-- 1. 예약완료된 숙소 -->
<p class="reservedTitle">예약완료된 숙소<p>
<div class="house">

<% for(Booking b : list) { 
	if(b.getHouseRequest().equals("예약완료"))  {%>
	<form class="myReserve" method="post">
	<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=b.getHouseNo()%>">
		<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
		<table id="houseContent">
			<tr>
				<td id="houseResv"><%=b.getHouseName() %></td>
			</tr>
			<tr>
				<td id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
				<td id="houseResv"><input type="hidden"  class="reservNo" name="reservNo" value="<%=b.getReservationNo() %>"></td>
			</tr>
		</table>
		</a>
		<div id="houseResv"><%=b.getHouseRequest() %></div>
		<input type="button"  class="reservCancel" value="예약취소" onclick="test();">
	</form>

	<% } 
	}%>
</div>

<p class="reservedTitle">이용완료 숙소</p>
<div class="house">
<% for(Booking b : list) { %>
	<form class="myReserved" method="post">
		<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
		<table id="houseContent">
			<tr>
				<td id="houseResv"><%=b.getHouseName() %></td>
			</tr>
			<tr>
				<td id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
			</tr>
		</table>
				<div id="houseResv"><%=b.getHouseRequest() %></div>
	</form>
	<% } %>
</div>

<p class="reservedTitle">취소한 숙소<p>
<div class="house">
<% for(Booking b : list) { 
if(b.getHouseRequest().equals("예약취소")) {%>
	<form class="myCancel" method="post">
		<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
		<table id="houseContent">
			<tr>
				<td id="houseResv"><%=b.getHouseName() %></td>
			</tr>
			<tr>
				<td id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
			</tr>
		</table>
				<div id="houseResv"><%=b.getHouseRequest() %></div>
	</form>

	<% } 
	} %>
</div>

<script>
	function test() {
		$(".myReserve").attr("action","<%=request.getContextPath() %>/member/reservationCancel").submit();
	};
</script>
