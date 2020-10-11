<%@page import="com.binbang.member.model.vo.Member"%>
<%@page import="com.binbang.house.model.vo.House"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath() %>/js/common/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
<%
	List<House> HouseList = (List)request.getAttribute("myHouse");
	String hostNo = (String)request.getAttribute("hostNo");
	Member m = (Member)session.getAttribute("m");
	
%>
</head>
<body>
	<h2>신고하기</h2>
	<form action="<%=request.getContextPath()%>/hostReportEnd" method="post" enctype="multipart/form-data">
		<select id="sel" name="selHouseNo" style="width:100%;" >
			 <% for(House h : HouseList) { %>
				<option class="houseCheck" name="houseNo" value="<%=h.getHouseNo()%>"><%=h.getHouseName() %></option>
			<%} %> 
		</select>
		
		<p>신고자</p>
		<p><%=m.getEmail() %></p>
		<p>신고카테고리</p>
		<input type="radio" name="complaintCate" value="위생" name="rd" id="rd1" required />
	    <label for="rd1">위생</label>
	    <input type="radio" name="complaintCate" value="불친절" name="rd" id="rd2" />
	    <label for="rd2">불친절</label>
	    <input type="radio" name="complaintCate" value="안전위협" name="rd" id="rd3" />
	    <label for="rd3">안전위협</label>
	    <input type="radio" name="complaintCate" value="허위광고" name="rd" id="rd4" />
	    <label for="rd4">허위광고</label>
	    <input type="radio" name="complaintCate" value="기타" name="rd" id="rd5" />
	    <label for="rd5">기타</label>
	    <p>신고사진</p>
	    <input type="file" name="complaintPic">
	    <p>신고이유:</p>
	    <textarea style="resize:none; width:100%; height:200px;" name="complaintDetail"></textarea>
	    <input type="hidden" name="hostNo" value="<%=hostNo%>">
	    <input type="submit" id="complaintBtn" value="신고하기">
	</form>
	<script>
		$("#sel").change(e => {
			console.log($(e.target).val());
		})

	</script>
</body>
</html>