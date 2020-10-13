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
		margin-bottom: 50px;
		font-weight:600;
		font-size:15px;
	}	
	.house {
		padding: 6% 20%;
		display:flex;
		margin-bottom:50px;
	}	
	.house > .myReserve,
	.house > .myReserved,
	.house > .myCancel {
		width:250px;
		height:300px;
		border:1px solid;
		margin-right: 15px;
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
		<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진"><%-- <%=b.getHouseMainPic() %> --%>
		</a>
		<table>
			<tr>
				<td><%=b.getHouseName() %></td>
				<td><%=b.getHouseRequest() %></td>
			</tr>
			<tr>
				<td><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
				<td>
					<input type="text" name="reservNo" value="<%=b.getReservationNo() %>">
					<input type="button" class="reservCancel" value="예약취소" onclick="test();">
				</td>
			</tr>
		</table>
	</form>

	<% } 
	}%>
</div>

<p class="reservedTitle">이용완료 숙소</p>
<div class="house">
<% for(Booking b : list) { %>
	<form class="myReserved" method="post">
		<img src="#" alt="사진"><%-- <%=b.getHouseMainPic() %> --%>
		<table>
			<tr>
				<td><%=b.getHouseName() %></td>
				<td><%=b.getHouseRequest() %></td>
			</tr>
			<tr>
				<td><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
			</tr>
		</table>
	</form>
	<% } %>
</div>

<p class="reservedTitle">취소한 숙소<p>
<div class="house">
<% for(Booking b : list) { 
if(b.getHouseRequest().equals("예약취소")) {%>
	<form class="myCancel" method="post">
		<img src="#" alt="사진"><%-- <%=b.getHouseMainPic() %> --%>
		<table>
			<tr>
				<td><%=b.getHouseName() %></td>
				<td><%=b.getHouseRequest() %></td>
			</tr>
			<tr>
				<td><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></td>
			</tr>
		</table>
	</form>

	<% } 
	} %>
</div>

<script>
	function test() {
		$(".myReserve").attr("action","<%=request.getContextPath() %>/member/reservationCancel").submit();
	};
</script>
