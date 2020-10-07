<%@page import="com.binbang.booking.model.vo.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<Booking> list = (List) request.getAttribute("list");
%>
<style>
.myHouse>ul {
	margin-bottom: 30px;
}

.houseReq {
	width: 100%;
	font-size: 14px;
}

.houseReq>tr {
	width: 100%;
}

tr>th {
	height: 50px;
	font-weight: 600;
	vertical-align: center;
}

tr>td {
	border: none;
	text-align: center;
	height: 50px;
	vertical-align: center;
	s
}

.houseReq input[type="submit"] {
	background: none;
	border: none;
	outline: none;
	cursor: pointer;
}
</style>


<ul>
	<li><h2>숙소예약완료리스트</h2></li>
</ul>

<div>
	<table class="houseReq">
		<tr>
			<th>승인날짜</th>
			<th>이메일</th>
			<th>예약자이름</th>
			<th>숙소이름</th>
			<th>체크인날짜</th>
			<th>체크인아웃</th>
			<th>게스트인원</th>
			<th>가격</th>
			<th>결제정보</th>
			<th>예약상태</th>
		</tr>
		<%
			for (Booking b : list) {
				if(b.getHouseRequest().equals("예약완료")) {
		%>
		<tr>
			<td><%=b.getApprovalDate()%></td>
			<td><%=b.getMemberEmail()%></td>
			<td><%=b.getGuestName()%></td>
			<td><%=b.getHouseName().length() > 15 ? b.getHouseName().substring(0, 15) + "..." : b.getHouseName()%></td>
			<td><%=b.getCheckInDate()%></td>
			<td><%=b.getCheckOutDate()%></td>
			<td><%=b.getGuestPnum()%></td>
			<td><%=b.getPrice()%></td>
			<td><%=b.getPaymentOption()%></td>
			<td><%=b.getHouseRequest() %></td>
		</tr>
		<%
				}
			}
		%>
	</table>
</div>

<ul>
	<li><h2>숙소취소리스트</h2></li>
</ul>

<div>
	<table class="houseReq">
		<tr>
			<th>승인날짜</th>
			<th>이메일</th>
			<th>예약자이름</th>
			<th>숙소이름</th>
			<th>체크인날짜</th>
			<th>체크인아웃</th>
			<th>게스트인원</th>
			<th>가격</th>
			<th>결제정보</th>
			<th>예약상태</th>
		</tr>
		
		<% 
			for (Booking b : list) {
				if(b.getHouseRequest().equals("예약취소")) {
		%>
		<tr>
			<td><%=b.getApprovalDate()%></td>
			<td><%=b.getMemberEmail()%></td>
			<td><%=b.getGuestName()%></td>
			<td><%=b.getHouseName().length() > 15 ? b.getHouseName().substring(0, 15) + "..." : b.getHouseName()%></td>
			<td><%=b.getCheckInDate()%></td>
			<td><%=b.getCheckOutDate()%></td>
			<td><%=b.getGuestPnum()%></td>
			<td><%=b.getPrice()%></td>
			<td><%=b.getPaymentOption()%></td>
			<td><%=b.getHouseRequest() %></td>
		</tr>
		<%
				}
			}
		
		%>
	</table>
</div>