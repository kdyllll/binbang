<%@page import="com.binbang.booking.model.vo.Booking"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	List<Booking> list = (List) request.getAttribute("list");
%>


<style>
.myHouse>ul {
	margin-bottom: 30px;
}

.houseReq {
	width: 100%;
	font-size:14px;
}

.houseReq > tr {
	width:100%;

}

tr>th {
	height:50px;
	font-weight : 600;
	vertical-align:center;
}

tr>td {
	border: none;
	text-align: center;
	height:50px;
	vertical-align:center;s
}

.houseReq input[type="submit"] {
	background: none;
	border: none;
	outline:none;
	cursor:pointer;	
	font-weight:600;
}

.denyH {
	color:#b33939;
}
</style>


<ul>
	<li><h2>숙소요청</h2></li>
</ul>

<div>
	<table class="houseReq">
		<tr>
			<th>요청날짜</th>
			<th>이메일</th>
			<th>예약자이름</th>
			<th>숙소이름</th>
			<th>체크인날짜</th>
			<th>체크인아웃</th>
			<th>게스트인원</th>
			<th>가격</th>
			<th>결제정보</th>
			<th>적립금사용</th>
			<th>적립금</th>
			<th></th>
		</tr>
		<%
			for (Booking b : list) {
		%>
		<tr>
			<td><%=b.getReservDate()%></td>
			<td><%=b.getMemberEmail()%></td>
			<td><%=b.getGuestName()%></td>
			<td><%=b.getHouseName().length() > 15 ? b.getHouseName().substring(0, 15) + "..." : b.getHouseName()%></td>
			<td><%=b.getCheckInDate()%></td>
			<td><%=b.getCheckOutDate()%></td>
			<td><%=b.getGuestPnum()%></td>
			<td><%=b.getPrice()%></td>
			<td><%=b.getPaymentOption()%></td>
			<td>- <%=b.getPointMinus() %></td>
			<td>+ <%=b.getPointPlus() %></td>
			<td>
				<form class="myHouseCon houseAll" method="post">
					<input type="hidden" name="reservNo" value="<%=b.getReservationNo() %>">
					<input type="hidden" name="houseName" value="<%=b.getHouseName() %>">
					<input type="hidden" name="checkIn" value="<%=b.getCheckInDate() %>">
					<input type="hidden" name="checkOut" value="<%=b.getCheckOutDate() %>">
					<input type="hidden" name="email" value="<%=b.getMemberEmail()%>">
					<input type="submit" class="acceptH" onclick="fn_houseAccept();" value="승인">
					<input type="submit" class="denyH" onclick="fn_houseDeny();" value="거절">
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</div>


<script>
	function fn_houseAccept() {
			$(".houseAll").attr("action","<%=request.getContextPath()%>/host/houseRequestAccept").submit();
	}
	function fn_houseDeny() {
			$(".houseAll").attr("action","<%=request.getContextPath()%>/host/houseRequestDeny").submit();
	}
</script>

