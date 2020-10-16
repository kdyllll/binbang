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
		flex-flow:wrap;					
	}	
	.house > .myReserve,
	.house > .myReserved,
	.house > .myCancel {
		position:relative;
		width:230px;
		height:280px;
		margin : 3%;
	}
	#houseResv{
		font-size: 14px;
		padding:6px;
		padding-left: 40px;		
	}
	.hr{
		margin-top:1%;
	}
	.reservCancel{		
		font-size: 14px;		
		width:100px;
		height:15px;
		outline:none;
		cursor:pointer;
		border:none;
		background-color: rgba(255, 255, 255, 0.836);
	}
	.houseContent{		
		display:flex;
		flex-direction: column;			
		width:250px;
		background-color: rgba(255, 255, 255, 0.836);
		position: absolute;
	  	top: 205px;
	  	left: 0;
	}
	.houseInfo{
		display:flex;
		justify-content:space-between;
		margin-top:6px;	
	}
	.houseReq{
		width:260px;
		display:flex;
		justify-content:space-between;
		margin-top:2px;
		font-size: 12px;		
	}
	.houseReq input{
		border:none;
		outLine:none;
		font-size: 11px;
	}
	
</style>

<!-- 숙소 -->
<!-- 1. 예약완료된 숙소 -->
<p class="reservedTitle">예약완료된 숙소<p>
<div class="house">

<% for(Booking b : list) { 
	if(b.getHouseRequest().equals("예약완료"))  {%>
	<form class="myReserve" method="post">
							<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=b.getHouseNo()%>&totalPrice=<%=b.getHousePrice()%>">
									<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
									<div class="houseContent">										
											<div id="houseResv"><%=b.getHouseName() %></div>										
											<div id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></div>										
									</div>
							</a>								
							<div class="houseReq">
								<div> <input type="text" value="<%=b.getHouseRequest() %>" class="hr">					 	</div>				
								<div> <input type="button"  class="reservCancel" value="예약취소" onclick="test();"></div>
							</div>
						
				<div><input type="hidden"  class="reservNo" name="reservNo" value="<%=b.getReservationNo() %>"></div>
	</form>

	<% } 
	}%>
</div>



<p class="reservedTitle">이용완료 숙소</p>
<div class="house">
<% for(Booking b : list) { %>
	<form class="myReserved" method="post">
				<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=b.getHouseNo()%>">
					<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
					<div class="houseContent">
						<div id="houseResv"><%=b.getHouseName() %></div>					
						<div id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></div>						
					</div>
				</a>	
				<div class="houseReq"><%=b.getHouseRequest() %></div>
	</form>
	<% } %>
</div>

<p class="reservedTitle">취소한 숙소<p>
<div class="house">
<% for(Booking b : list) { 
if(b.getHouseRequest().equals("예약취소")) {%>
	<form class="myCancel" method="post">
		<a href="<%=request.getContextPath()%>/house/houseDetailMove?houseNo=<%=b.getHouseNo()%>">	
		<img src="<%=request.getContextPath() %>/upload/house/<%=b.getHouseMainPic() %>" style="width:100%; height:90%;"  alt="사진">
					<div class="houseContent">
						<div id="houseResv"><%=b.getHouseName() %></div>												
						<div id="houseResv"><%=b.getCheckInDate() %> ~ <%=b.getCheckOutDate() %></div>						
					</div>
		</a>	
				<div class="houseReq"><%=b.getHouseRequest() %></div>
	</form>

	<% } 
	} %>
</div>

<script>
	function test() {
		$(".myReserve").attr("action","<%=request.getContextPath() %>/mypage/reservationCancel").submit();
	};
</script>
