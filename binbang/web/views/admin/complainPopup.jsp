<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.binbang.member.model.vo.Complaint" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title></title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/complaintPopup.css" />
<script src="<%=request.getContextPath() %>/js/common/jquery-3.5.1.min.js"></script>
<%
	Complaint com=(Complaint)request.getAttribute("com");
%>
</head>

<body>

	<div class="findIdPopup">

		<p class="popupTitle">호스트 신고</p>

		<div class="findIdLine"></div>

		<form id="enterNamePhone" method="post">
			<p class="complainTitle">신고한 회원 아이디 : <%=com.getMemberEmail() %></p> 
           	<p class="complainTitle">호스트 이름 : <%=com.getHostName() %></p>
           	<p class="complainTitle">숙소 번호 : <%=com.getHouseNo() %></p>
           	<p class="complainTitle">신고 날짜 : <%=com.getComplaintDate() %></p>
           	<p class="complainTitle eachComplainReason">신고 사유 : <%=com.getComplaintCategory() %></p>
           	<div class="reasonBox"><%=com.getComplaintDetail() %></div>
		</form>
		
	</div>

</body>
</html>



