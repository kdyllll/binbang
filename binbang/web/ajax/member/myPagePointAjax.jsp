<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.binbang.member.model.vo.Member,com.binbang.booking.model.vo.Booking"%>
<%@page import="java.util.List"%>
<%@ include file="/views/common/commonLink.jsp"%>
<%
	Member m = (Member) session.getAttribute("m");
	List<Booking> list =(List) request.getAttribute("list");
%>
<style>
/* 4. POINT 사용내역 */
.section {
	padding: 6% 20%;			
}
.section .point {
	width: 500px;
	display: flex;
	flex-direction: column;	
	margin-bottom: 10%;
}

.border{
display:flex;
justify-content:center;
}

.addContent {
	padding:0 2%;	
}

/* POINT변화유무 */
.pointCount .line6 {
	width: 100%;
	height: 2px;
	background-color: black;
	margin: 2% 0;
}
.pointCount .line7 {
	width: 100%;
	height: 1px;
	background-color: black;
	opacity: 40%;
	margin-top: 2%;
}
.pointCount {
	margin-top: 1%;
}
.pointCount>ul {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	margin: 1% 0;
}
</style>

<!-- 2. 총 포인트 -->
<div class="border">
	<div class="point">
		<div>
			<div class="pointContents">
				POINT : <%=m.getTotalPoint()%>
			</div>
		</div>
	
		<div class="pointCount">
			<div class="line6"></div>
				<%for(Booking b : list) { %>
					<!-- 포인트사용시 마다 추가/적립-->
							<%if(b.getPointMinus()!=0){ %>
								<ul>
									<li class="addDate"><%=b.getApprovalDate()%></li>
									<li class="addContent"><%=b.getHouseName()%>이용</li>												
									<li class="addpoint"><%=b.getPointMinus()%> point 사용</li>
								</ul>
							<div class="line7"></div>
							<%}else if(b.getPointPlus()!=0){ %>
								<ul>
									<li class="addDate"><%=b.getApprovalDate()%></li>																
									<li class="addpoint"><%=b.getPointPlus()%> point 적립</li>
								</ul>
							<div class="line7"></div>
						<%}else{ %>				
						<%} %>
					<%}%>	
			</div>
		
	</div>
</div>


